import { VideoEditorFormat } from "./types/VideoEditingFormat";
import { parseTrack } from "./parseTrack";
import { calculateTotalLength } from "./calculateTotalLength";

export function parseTracks({ schema }: { schema: VideoEditorFormat }): string {
  const totalLength = calculateTotalLength(schema.tracks);
  let tracksCommand = `color=c=black:s=${schema.output.width}x${schema.output.height}:d=${totalLength}[base];\n`;

  for (const [trackName, track] of Object.entries(schema.tracks)) {
    tracksCommand += parseTrack({
      trackName,
      track,
      inputs: schema.inputs,
      output: schema.output,
    });
  }

  const videoTracks = Object.entries(schema.tracks).filter(
    ([, track]) => track.type === "video",
  );
  const audioTracks = Object.entries(schema.tracks).filter(
    ([, track]) => track.type === "audio",
  );

  const videoTrackNames = videoTracks.map(([trackName]) => trackName);

  let previousTrackName = "base";
  for (let i = 0; i < videoTracks.length; i++) {
    const [videoTrackName] = videoTracks[i];

    let combinedOverlayName =
      i === videoTracks.length - 1
        ? "video_output"
        : `combined_${videoTrackName}`;

    tracksCommand += `[${previousTrackName}][${videoTrackName}]overlay=0:0[${combinedOverlayName}];\n`;
    previousTrackName = combinedOverlayName;
  }

  for (const [audioTrackName] of audioTracks) {
    tracksCommand += `[${audioTrackName}]`;
  }

  tracksCommand += `amix=inputs=${audioTracks.length}:duration=longest[audio_output];\n`;

  return tracksCommand;
}
