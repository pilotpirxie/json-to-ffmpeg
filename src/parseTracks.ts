import { VideoEditorFormat } from "./types/VideoEditingFormat";
import { parseTrack } from "./parseTrack";

export function parseTracks({ schema }: { schema: VideoEditorFormat }): string {
  let tracksCommand = "";

  for (const [trackName, track] of Object.entries(schema.tracks)) {
    tracksCommand += parseTrack({
      trackName,
      track,
      inputs: schema.inputs,
    });
  }

  const videoTracks = Object.entries(schema.tracks).filter(
    ([, track]) => track.type === "video",
  );
  const audioTracks = Object.entries(schema.tracks).filter(
    ([, track]) => track.type === "audio",
  );

  const videoTrackNames = videoTracks.map(([trackName]) => trackName);

  let previousTrackName = videoTrackNames[0];
  for (const [videoTrackName] of videoTracks.slice(1)) {
    let combinedOverlayName = "video_output";
    if (videoTrackName !== videoTrackNames[videoTrackNames.length - 1]) {
      combinedOverlayName = `combined_${videoTrackName}`;
    }

    tracksCommand += `[${previousTrackName}][${videoTrackName}]overlay=0:0[${combinedOverlayName}];\n`;
    previousTrackName = combinedOverlayName;
  }

  for (const [audioTrackName] of audioTracks) {
    tracksCommand += `[${audioTrackName}]`;
  }

  tracksCommand += `amix=inputs=${audioTracks.length}:duration=longest[audio_output];\n`;

  return tracksCommand;
}
