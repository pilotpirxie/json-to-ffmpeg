import { ImageClip } from "./types/Clip";
import { Inputs } from "./types/Inputs";
import { findInputIndex } from "./utils/findInputIndex";
import { findInput } from "./utils/findInput";

export function parseImageClip({
  clip,
  inputs,
}: {
  clip: ImageClip;
  inputs: Inputs;
}): string {
  const { name, duration, source, transform } = clip;
  const { width, height, rotation, opacity } = transform;

  const inputIndex = findInputIndex(inputs, source);
  const input = findInput(inputs, source);
  const { hasVideo } = input;

  let filters: string[] = [];

  if (hasVideo) {
    filters.push(`loop=loop=-1:size=${duration}`);
    filters.push(`setpts=PTS-STARTPTS`);
    filters.push(`scale=${width}:${height}`);
    filters.push(`rotate=${rotation}`);
    filters.push(`colorchannelmixer=aa=${opacity}`);
    // filters.push(`overlay=${x}:${y}`);
  }

  return `[${inputIndex}:v]${filters.join(",")}[${name}];`;
}
