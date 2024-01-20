import { VideoEditorFormat } from "./types/VideoEditingFormat";
import { parseTrack } from "./parseTrack";
import { calculateTotalLength } from "./calculateTotalLength";
import { getRandomUID } from "./utils/uid";
import { InputFiles } from "./types/InputFiles";

/**
 * Loop over each track, parse it, and combine
 * as two streams. One for video and one for audio.
 * @param schema
 * @param inputFiles
 */
export function parseTracks({
  schema,
  inputFiles,
}: {
  schema: VideoEditorFormat;
  inputFiles: InputFiles;
}): string {
  const totalLength = calculateTotalLength(schema.tracks, schema.transitions);

  /**
   * Create a black base video stream to overlay.
   * It's background of the whole video, visible on the bottom.
   */
  const width = Math.round(schema.output.width * schema.output.scaleRatio);
  const height = Math.round(schema.output.height * schema.output.scaleRatio);
  let tracksCommand = `color=c=black:s=${width}x${height}:d=${totalLength}[base];\n`;

  /**
   * Loop over each track object schema and parse it.
   */
  for (const [trackName, track] of Object.entries(schema.tracks)) {
    tracksCommand += parseTrack({
      trackName,
      track,
      output: schema.output,
      totalLength,
      transitions: schema.transitions,
      inputFiles,
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
  if (audioTracks.length > 1) {
    tracksCommand += `amix=inputs=${audioTracks.length}:duration=longest[audio_output];`;
  } else if (audioTracks.length === 1) {
    tracksCommand += `volume=1[audio_output];`;
  } else {
    tracksCommand += `anullsrc=channel_layout=stereo:sample_rate=44100:d=${totalLength}[audio_output];`;
  }

  return tracksCommand;
}
