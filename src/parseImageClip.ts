import { ImageClip } from "./types/Clip";
import { Inputs } from "./types/Inputs";
import { findInputIndex } from "./utils/findInputIndex";
import { findInput } from "./utils/findInput";
import { Output } from "./types/Output";
import { getRandomUID } from "./utils/uid";

export function parseImageClip({
  clip,
  inputs,
  output,
}: {
  clip: ImageClip;
  inputs: Inputs;
  output: Output;
}): string {
  const { name, duration, source, transform } = clip;
  const { width, height, rotation, opacity, y, x } = transform;

  const inputIndex = findInputIndex(inputs, source);
  const input = findInput(inputs, source);
  const { hasVideo } = input;

  let filters: string[] = [];

  if (hasVideo) {
    filters.push(
      `loop=loop=${duration * output.framerate}:size=${
        duration * output.framerate
      }`,
    );
    filters.push(`setpts=PTS-STARTPTS`);
    filters.push(`scale=${width}:${height}`);
    filters.push(`rotate=${rotation}`);
    filters.push(`format=rgba,colorchannelmixer=aa=${opacity}`);
  }
  const baseTrackLayerName = `${getRandomUID(8)}_base`;
  const clipTrackLayerName = `${getRandomUID(8)}_clip`;

  let clipCommand = `color=black@0.0:s=${output.width}x${output.height}:d=${clip.duration}[${baseTrackLayerName}];\n`;
  clipCommand += `[${inputIndex}:v]${filters.join(
    ",",
  )}[${clipTrackLayerName}];\n`;
  clipCommand += `[${baseTrackLayerName}][${clipTrackLayerName}]overlay=${x}:${y}:format=auto[${name}];`;

  return clipCommand;
}
