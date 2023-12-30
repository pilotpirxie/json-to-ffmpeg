import { VideoClip } from "./types/Clip";
import { Inputs } from "./types/Inputs";
import { findInputIndex } from "./utils/findInputIndex";
import { findInput } from "./utils/findInput";

export function parseVideoClip({
  clip,
  inputs,
}: {
  clip: VideoClip;
  inputs: Inputs;
}): string {
  const { duration, sourceStartOffset, source, transform, name } = clip;
  const { width, height, rotation, opacity } = transform;

  const inputIndex = findInputIndex(inputs, source);
  const input = findInput(inputs, source);
  const { hasVideo } = input;

  let filters: string[] = [];

  if (hasVideo) {
    filters.push(`trim=${sourceStartOffset}:${sourceStartOffset + duration}`);
    filters.push(`setpts=PTS-STARTPTS`);
    filters.push(`scale=${width}:${height}`);
    filters.push(`rotate=${rotation}`);
    filters.push(`colorchannelmixer=aa=${opacity}`);
    // filters.push(`overlay=${x}:${y}`);
  }

  return `[${inputIndex}:v]${filters.join(",")}[${name}];`;
}
