import { Track } from "./types/Tracks";
import { Inputs } from "./types/Inputs";
import { parseClip } from "./parseClip";
import { Output } from "./types/Output";
import { getRandomUID } from "./utils/uid";

export function parseTrack({
  trackName,
  track,
  inputs,
  output,
  totalLength,
}: {
  trackName: string;
  track: Track;
  inputs: Inputs;
  output: Output;
  totalLength: number;
}): string {
  let clipsCommand = "";
  let clipLabelsToConcat = [];
  let lastEndTime = 0;
  let gapsCount = 0;

  for (const clip of track.clips) {
    if (clip.timelineTrackStart > lastEndTime) {
      const gapDuration = clip.timelineTrackStart - lastEndTime;

      if (gapDuration > 0) {
        const gapLabelName = `gap${getRandomUID()}`;
        if (track.type === "video") {
          clipsCommand += `color=c=transparent:s=${output.width}x${output.height}:d=${gapDuration}[${gapLabelName}];\n`;
        } else if (track.type === "audio") {
          clipsCommand += `anullsrc=d=${gapDuration}[${gapLabelName}];`;
        }

        clipLabelsToConcat.push(gapLabelName);
        gapsCount++;
      }
    }

    clipsCommand += parseClip({ clip, inputs, output });
    clipLabelsToConcat.push(clip.name);
    lastEndTime = clip.timelineTrackStart + clip.duration;
  }

  if (lastEndTime < totalLength) {
    const gapDuration = totalLength - lastEndTime;

    if (gapDuration > 0) {
      const gapLabelName = `gap${getRandomUID()}`;
      if (track.type === "video") {
        clipsCommand += `color=c=transparent:s=${output.width}x${output.height}:d=${gapDuration}[${gapLabelName}];\n`;
      } else if (track.type === "audio") {
        clipsCommand += `anullsrc=d=${gapDuration}[${gapLabelName}];`;
      }

      clipLabelsToConcat.push(gapLabelName);
      gapsCount++;
    }
  }

  for (const label of clipLabelsToConcat) {
    clipsCommand += `[${label}]`;
  }

  if (track.type === "video") {
    clipsCommand += `concat=n=${clipLabelsToConcat.length}:v=1:a=0[${trackName}];\n`;
  } else if (track.type === "audio") {
    clipsCommand += `concat=n=${clipLabelsToConcat.length}:v=0:a=1[${trackName}];\n`;
  }

  return clipsCommand;
}
