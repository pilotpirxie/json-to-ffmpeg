import { Track } from "./types/Tracks";
import { Inputs } from "./types/Inputs";
import { parseClip } from "./parseClip";

export function parseTrack({
  trackName,
  track,
  inputs,
}: {
  trackName: string;
  track: Track;
  inputs: Inputs;
}): string {
  let clips = "";

  for (const clip of track.clips) {
    clips += parseClip({ clip, inputs });
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
