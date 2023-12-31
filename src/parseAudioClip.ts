import { AudioClip } from "./types/Clip";
import { Inputs } from "./types/Inputs";
import { findInputIndex } from "./utils/findInputIndex";

/**
 * Parse an audio clip object schema and return a ffmpeg filter command.
 * @param clip
 * @param inputs
 */
export function parseAudioClip({
  clip,
  inputs,
}: {
  clip: AudioClip;
  inputs: Inputs;
}): string {
  const { duration, sourceStartOffset, source, volume, name } = clip;

  const inputIndex = findInputIndex(inputs, source);

  let filters: string[] = [];

  /**
   * The atrim filter is used to cut the clip
   * to the correct duration and from the
   * correct start offset.
   */
  filters.push(`atrim=${sourceStartOffset}:${sourceStartOffset + duration}`);

  /**
   * Reset the presentation timestamp to 0 after trimming.
   */
  filters.push(`asetpts=PTS-STARTPTS`);

  /**
   * Set the volume of the clip.
   */
  filters.push(`volume=${volume}`);

  return `[${inputIndex}:a]${filters.join(",")}[${name}];`;
}
