import { Track } from "./types/Tracks";
import { Inputs } from "./types/Inputs";
import { parseClip } from "./parseClip";
import { Output } from "./types/Output";
import { getRandomUID } from "./utils/uid";

/**
 * Parse a single track into a string.
 * @param trackName
 * @param track
 * @param inputs
 * @param output
 * @param totalLength
 */
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
  let previousClipEndTime = 0;

  /**
   * Fill all gaps between clips with transparent video or silence,
   * add the gap to the clipsCommand, add the gap label to the concat array,
   * add the clip to the concat array.
   */
  for (const clip of track.clips) {
    if (clip.timelineTrackStart > previousClipEndTime) {
      const gap = getGapFiller({
        trackType: track.type,
        output,
        duration: clip.timelineTrackStart - previousClipEndTime,
      });

      clipsCommand += gap.command;
      clipLabelsToConcat.push(gap.gapLabelName);
    }

    clipsCommand += parseClip({ clip, inputs, output });
    clipLabelsToConcat.push(clip.name);
    previousClipEndTime = clip.timelineTrackStart + clip.duration;
  }

  /**
   * If the last clip ends before the totalLength of the video, fill the gap
   * with transparent video or silence, add the gap to the clipsCommand, add
   * the gap label to the concat array.
   */
  if (previousClipEndTime < totalLength) {
    const gap = getGapFiller({
      trackType: track.type,
      output,
      duration: totalLength - previousClipEndTime,
    });

    clipsCommand += gap.command;
    clipLabelsToConcat.push(gap.gapLabelName);
  }

  /**
   * Concat all clips in the concat array into a single clip.
   * Use concat filter for both because we want to achieve sequence of clips.
   */
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

/**
 * Get a gap filler command depending on the track type.
 * For video, it will be a transparent video, for audio, it will be silence.
 * @param trackType
 * @param output
 * @param duration
 */
export function getGapFiller({
  trackType,
  output,
  duration,
}: {
  trackType: "video" | "audio";
  output: Output;
  duration: number;
}): { command: string; gapLabelName: string } {
  const gapLabelName = `gap_${getRandomUID()}`;

  return {
    command:
      trackType === "video"
        ? `color=c=black@0.0:s=${output.width}x${output.height}:d=${duration}[${gapLabelName}];\n`
        : `anullsrc=d=${duration}[${gapLabelName}];\n`,
    gapLabelName,
  };
}
