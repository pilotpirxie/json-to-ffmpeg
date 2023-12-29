import { Tracks } from "./types/Tracks";

export function calculateTotalLength(tracks: Tracks): number {
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
