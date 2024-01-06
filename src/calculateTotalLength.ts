import { Tracks } from "./types/Tracks";
import { Transition } from "./types/Transition";

/**
 * Get total length of the output video.
 * Video length is also the length of the longest track.
 * To find the longest track, we need to find the very last clip
 * and add its duration to its start time.
 *
 * TODO: After adding transitions, this function will need to be adjusted to
 * accurately reflect the final video length. Transitions, especially those that
 * overlay clips such as xfade, effectively shorten the apparent duration of
 * the individual clips they connect. This is because the transition period partly
 * overlaps with the end of one clip and the beginning of the next, thereby reducing
 * the total time during which each clip is fully visible in sequential timeline.
 * The calculation needs to account for these overlapping durations to ensure
 * an accurate total video length.
 *
 * @param tracks
 * @param transitions
 */
export function calculateTotalLength(
  tracks: Tracks,
  transitions: Transition[],
): number {
  let maxLength = 0;
  Object.values(tracks).forEach((track) => {
    track.clips.forEach((clip) => {
      const end = clip.timelineTrackStart + clip.duration;
      if (end > maxLength) {
        maxLength = end;
      }
    });
  });

  const transitionsLength = transitions
    .filter((transition) => transition.from !== null && transition.to !== null)
    .reduce((acc, transition) => acc + transition.duration, 0);

  return maxLength - transitionsLength;
}
