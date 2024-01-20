import { VideoEditorFormat } from "./types/VideoEditingFormat";
import { InputFiles } from "./types/InputFiles";

/**
 * Return all the inputs as a part of ffmpeg command.
 * @param inputs
 */
export function parseInputs({ schema }: { schema: VideoEditorFormat }): {
  command: string;
  inputFiles: InputFiles;
} {
  let inputsCommand = "";
  const inputFiles: InputFiles = [];

  for (const [trackName, track] of Object.entries(schema.tracks)) {
    for (const clip of track.clips) {
      const { source, clipType, name, sourceStartOffset, duration } = clip;
      const { tempDir } = schema.output;

      if (clipType === "video") {
        inputsCommand += `-i ${tempDir}/${name}.mp4 \\\n`;
        inputFiles.push({
          file: `${name}_tmp.mp4`,
          name: `${name}`,
        });
      }
    }
  }

  for (const [inputName, input] of Object.entries(schema.inputs)) {
    if (input.type === "video") continue;

    inputsCommand += `-i ${input.file} \\\n`;
    inputFiles.push({
      name: inputName,
      file: input.file,
    });
  }

  return {
    command: inputsCommand,
    inputFiles,
  };
}
