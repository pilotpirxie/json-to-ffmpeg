import { ImageClip } from "./types/Clip";
import { Inputs } from "./types/Inputs";
import { findInputIndex } from "./utils/findInputIndex";
import { findInput } from "./utils/findInput";
import { Output } from "./types/Output";

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
  const { width, height, rotation, opacity } = transform;

  const inputIndex = findInputIndex(inputs, source);
  const input = findInput(inputs, source);
  const { hasVideo } = input;

  let filters: string[] = [];

  if (hasVideo) {
    filters.push(`loop=loop=-1:size=${duration * output.framerate}`);
    filters.push(`setpts=PTS-STARTPTS`);
    filters.push(`scale=${width}:${height}`);
    filters.push(`rotate=${rotation}`);
    filters.push(`colorchannelmixer=aa=${opacity}`);
    // filters.push(`overlay=${x}:${y}`);
  }

  return `[${inputIndex}:v]${filters.join(",")}[${name}];`;
}
