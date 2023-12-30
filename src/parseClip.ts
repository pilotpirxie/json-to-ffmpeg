import { Clip } from "./types/Clip";
import { Inputs } from "./types/Inputs";
import { parseVideoClip } from "./parseVideoClip";
import { parseAudioClip } from "./parseAudioClip";
import { parseImageClip } from "./parseImageClip";
import { Output } from "./types/Output";

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

  if (clip.clipType === "video") {
    clipString += parseVideoClip({ clip, inputs, output });
  } else if (clip.clipType === "audio") {
    clipString += parseAudioClip({ clip, inputs });
  } else if (clip.clipType === "image") {
    clipString += parseImageClip({ clip, inputs, output });
  }

  return clipString + "\n";
}
