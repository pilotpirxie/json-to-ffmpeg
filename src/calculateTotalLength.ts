import { Tracks } from "./types/Tracks";
import { Transition } from "./types/Transition";

/**
 * Get total length of the output video.
 * Video length is also the length of the longest track.
 * To find the longest track, we need to find the very last clip
 * and add its duration to its start time.
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

  return maxLength;
}
