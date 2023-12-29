import { Clip } from "./types/Clip";
import { Inputs } from "./types/Inputs";
import { parseVideoClip } from "./parseVideoClip";
import { parseAudioClip } from "./parseAudioClip";
import { parseImageClip } from "./parseImageClip";

export function parseClip({
  clip,
  inputs,
}: {
  clip: Clip;
  inputs: Inputs;
}): string {
  let clipString = "";

  if (clip.clipType === "video") {
    clipString += parseVideoClip({ clip, inputs });
  } else if (clip.clipType === "audio") {
    clipString += parseAudioClip({ clip, inputs });
  } else if (clip.clipType === "image") {
    clipString += parseImageClip({ clip, inputs });
  }

  return clipString + "\n";
}
