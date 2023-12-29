import { Track } from "./types/Tracks";
import { Inputs } from "./types/Inputs";
import { parseClip } from "./parseClip";
import { Output } from "./types/Output";

export function parseTrack({
  trackName,
  track,
  inputs,
  output,
}: {
  trackName: string;
  track: Track;
  inputs: Inputs;
  output: Output;
}): string {
  let clips = "";

  for (const clip of track.clips) {
    clips += parseClip({ clip, inputs, output });
  }

  for (const clip of track.clips) {
    clips += `[${clip.name}]`;
  }

  if (track.type === "video") {
    clips += `concat=n=${track.clips.length}:v=1:a=0[${trackName}];\n`;
  } else if (track.type === "audio") {
    clips += `concat=n=${track.clips.length}:v=0:a=1[${trackName}];\n`;
  }

  return clips;
}
