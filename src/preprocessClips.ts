import { VideoEditorFormat } from "./types/VideoEditingFormat";

export function preprocessClips({
  schema,
}: {
  schema: VideoEditorFormat;
}): string {
  let clipsCommand = "mkdir -p ./tmp\n";

  for (const [, track] of Object.entries(schema.tracks)) {
    for (const clip of track.clips) {
      const { source, clipType, name, sourceStartOffset, duration } = clip;

      if (clipType === "video") {
        const input = schema.inputs[source];

        clipsCommand += `ffmpeg -y -i ${input.file} -ss ${sourceStartOffset} -t ${duration} -r ${schema.output.framerate} ./tmp/${name}.mp4\n`;
      }
    }
  }

  return clipsCommand;
}
