import { Clip } from "./types/Clip";
import { Inputs } from "./types/Inputs";
import { parseVideoClip } from "./parseVideoClip";
import { parseAudioClip } from "./parseAudioClip";
import { Output } from "./types/Output";

/**
 * This is simple intermediate function that serves
 * as a router for the different clip type parsers.
 * @param clip
 * @param inputs
 * @param output
 */
export function parseClip({
  clip,
  inputs,
  output,
}: {
  clip: Clip;
  inputs: Inputs;
  output: Output;
}): string {
  let clipString = "";

  if (clip.clipType === "video" || clip.clipType === "image") {
    clipString += parseVideoClip({ clip, inputs, output });
  } else if (clip.clipType === "audio") {
    clipString += parseAudioClip({ clip, inputs });
  }

  return clipString + "\n";
}
