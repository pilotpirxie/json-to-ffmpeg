import { ImageClip, VideoClip } from "./types/Clip";
import { Inputs } from "./types/Inputs";
import { findInputIndex } from "./utils/findInputIndex";
import { Output } from "./types/Output";
import { getRandomUID } from "./utils/uid";

/**
 * Parse a video clip object schema and return a ffmpeg filter command.
 * @param clip
 * @param inputs
 * @param output
 */
export function parseVideoClip({
  clip,
  inputs,
  output,
}: {
  clip: VideoClip | ImageClip;
  inputs: Inputs;
  output: Output;
}): string {
  const { duration, sourceStartOffset, source, transform, name, clipType } =
    clip;
  const { width, height, rotation, opacity, y, x } = transform;

  const inputIndex = findInputIndex(inputs, source);

  let filters: string[] = [];

  if (clipType === "video") {
    /**
     * The trim filter is used to cut the clip
     * to the correct duration and from the
     * correct start offset.
     */
    filters.push(`trim=${sourceStartOffset}:${sourceStartOffset + duration}`);
  } else if (clipType === "image") {
    /**
     * The loop filter is used to extend length of the image video stream.
     * By default, is only one frame long.
     */
    filters.push(
      `loop=loop=${duration * output.framerate}:size=${
        duration * output.framerate
      }`,
    );
  }

  /**
   * Reset the presentation timestamp to 0 after trimming.
   */
  filters.push(`setpts=PTS-STARTPTS`);

  /**
   * Scale the clip to the correct size.
   */
  filters.push(`scale=${width}:${height}`);

  /**
   * To change the opacity of the clip, we have to
   * make sure it has an alpha channel. Naive approach
   * is to set format to rgba. At the worst case, this
   * is redundant. Then we can set the alpha channel to
   * the desired opacity.
   */
  filters.push(`format=rgba,colorchannelmixer=aa=${opacity}`);

  /**
   * Base and clip track layers are used to rotate and position the clip.
   * Base layer is a transparent video stream that is used as a bigger background
   * for eventually scaled and rotated clip.
   */
  const baseTrackLayerName = `${getRandomUID(8)}_base`;
  const clipTrackLayerName = `${getRandomUID(8)}_clip`;

  let clipCommand = `color=black@0.0:s=${output.width}x${output.height}:d=${clip.duration}[${baseTrackLayerName}];\n`;
  clipCommand += `[${inputIndex}:v]${filters.join(
    ",",
  )}[${clipTrackLayerName}];\n`;

  let postOverlayFilters: string[] = [];

  /**
   * Rotation is applied to the combined stream after overlaying because
   * otherwise the clip would be cut outside of viewport.
   */
  postOverlayFilters.push(`rotate=${rotation}`);

  /**
   * Position translation is applied during overlay, because it allows
   * to position the clip relative to the base layer which is the viewport size.
   */
  clipCommand += `[${baseTrackLayerName}][${clipTrackLayerName}]overlay=${x}:${y}:format=auto,${postOverlayFilters.join(
    ",",
  )}[${name}];`;

  return clipCommand;
}
