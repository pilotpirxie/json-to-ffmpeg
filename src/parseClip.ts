import { Clip } from "./types/Clip";
import { parseVideoClip } from "./parseVideoClip";
import { parseAudioClip } from "./parseAudioClip";
import { Output } from "./types/Output";
import { InputFiles } from "./types/InputFiles";

/**
 * This is simple intermediate function that serves
 * as a router for the different clip type parsers.
 * @param clip
 * @param output
 * @param inputFiles
 */
export function parseClip({
  clip,
  output,
  inputFiles,
}: {
  clip: Clip;
  output: Output;
  inputFiles: InputFiles;
}): string {
  let clipString = "";

  if (clip.clipType === "video" || clip.clipType === "image") {
    clipString += parseVideoClip({ clip, inputFiles, output });
  } else if (clip.clipType === "audio") {
    clipString += parseAudioClip({ clip, inputFiles });
  }

  return clipString + "\n";
}
