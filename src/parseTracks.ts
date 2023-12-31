import { VideoEditorFormat } from "./types/VideoEditingFormat";
import { parseTrack } from "./parseTrack";
import { calculateTotalLength } from "./calculateTotalLength";
import { getRandomUID } from "./utils/uid";

/**
 * Loop over each track, parse it, and combine
 * as two streams. One for video and one for audio.
 * @param schema
 */
export function parseTracks({ schema }: { schema: VideoEditorFormat }): string {
  const totalLength = calculateTotalLength(schema.tracks);

  /**
   * Create a black base video stream to overlay.
   * It's background of the whole video, visible on the bottom.
   */
  let tracksCommand = `color=c=black:s=${schema.output.width}x${schema.output.height}:d=${totalLength}[base];\n`;

  /**
   * Loop over each track object schema and parse it.
   */
  for (const [trackName, track] of Object.entries(schema.tracks)) {
    tracksCommand += parseTrack({
      trackName,
      track,
      inputs: schema.inputs,
      output: schema.output,
      totalLength,
    });
  }

  /**
   * Combine all video and audio tracks into two video streams.
   * Combine all videos into one video stream overlaying each other.
   * The lowest video stream is the base video stream, then
   * streams from the tracks are on top one by one. To combine
   * them, intermediate overlay streams are created.
   */
  const videoTracks = Object.entries(schema.tracks).filter(
    ([, track]) => track.type === "video",
  );
  const audioTracks = Object.entries(schema.tracks).filter(
    ([, track]) => track.type === "audio",
  );

  let previousTrackName = "base";
  for (let i = 0; i < videoTracks.length; i++) {
    const [videoTrackName] = videoTracks[i];

    let combinedOverlayName =
      i === videoTracks.length - 1
        ? "video_output"
        : `${getRandomUID(8)}_combined_track`;

    tracksCommand += `[${previousTrackName}][${videoTrackName}]overlay=0:0[${combinedOverlayName}];\n`;
    previousTrackName = combinedOverlayName;
  }

  /**
   * Audio tracks are combined by mixing them together.
   * The output of the mix is the final audio stream.
   */
  for (const [audioTrackName] of audioTracks) {
    tracksCommand += `[${audioTrackName}]`;
  }
  tracksCommand += `amix=inputs=${audioTracks.length}:duration=longest[audio_output];`;

  return tracksCommand;
}
