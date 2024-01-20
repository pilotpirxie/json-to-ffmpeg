import { ImageClip, VideoClip } from "./types/Clip";
import { findInputIndex } from "./utils/findInputIndex";
import { Output } from "./types/Output";
import { getRandomUID } from "./utils/uid";
import { InputFiles } from "./types/InputFiles";

/**
 * Parse a video clip object schema and return a ffmpeg filter command.
 * @param clip
 * @param output
 * @param inputFiles
 */
export function parseVideoClip({
  clip,
  output,
  inputFiles,
}: {
  clip: VideoClip | ImageClip;
  output: Output;
  inputFiles: InputFiles;
}): string {
  const { duration, sourceStartOffset, source, transform, name, clipType } =
    clip;
  const { rotation, opacity } = transform;

  const width = Math.round(transform.width * output.scaleRatio);
  const height = Math.round(transform.height * output.scaleRatio);
  const x = Math.round(transform.x * output.scaleRatio);
  const y = Math.round(transform.y * output.scaleRatio);

  let inputIndex = 0;
  if (clipType === "video") {
    inputIndex = findInputIndex(inputFiles, name);
  } else {
    inputIndex = findInputIndex(inputFiles, source);
  }

  let filters: string[] = [];

  if (clipType === "image") {
    /**
     * The loop filter is used to extend length of the image video stream.
     * By default, is only one frame long.
     */
    filters.push(
      `loop=loop=${duration * output.framerate}:size=${
        duration * output.framerate
      }`,
    );

    /**
     * Set the start offset of the image video stream.
     */
    filters.push(`setpts=PTS-STARTPTS`);

    /**
     * Set framerate to the output framerate.
     */
    filters.push(`fps=${output.framerate}`);
  }

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

  const outputWidth = Math.round(output.width * output.scaleRatio);
  const outputHeight = Math.round(output.height * output.scaleRatio);

  let clipCommand = `color=black@0.0:s=${outputWidth}x${outputHeight}:d=${clip.duration}[${baseTrackLayerName}];\n`;
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
  )},fps=${output.framerate}[${name}];`;

  return clipCommand;
}
