import { AudioClip } from "./types/Clip";
import { Inputs } from "./types/Inputs";
import { findInputIndex } from "./utils/findInputIndex";
import { findInput } from "./utils/findInput";

export function parseAudioClip({
  clip,
  inputs,
}: {
  clip: AudioClip;
  inputs: Inputs;
}): string {
  const { duration, sourceStartOffset, source, volume, name } = clip;

  const inputIndex = findInputIndex(inputs, source);
  const input = findInput(inputs, source);
  const { hasAudio } = input;

  let filters: string[] = [];

  if (hasAudio) {
    filters.push(`atrim=${sourceStartOffset}:${duration}`);
    filters.push(`asetpts=PTS-STARTPTS`);
    filters.push(`volume=${volume}`);
  }

  return `[${inputIndex}:a]${filters.join(",")}[${name}];`;
}
