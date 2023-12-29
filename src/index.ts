import { VideoEditorFormat } from "./types/VideoEditingFormat";
import { parseInputs } from "./parseInputs";
import { parseTracks } from "./parseTracks";
import { parseOutput } from "./parseOutput";

export function parseSchema(schema: VideoEditorFormat): string {
  let outputCommand = "ffmpeg ";

  outputCommand += parseInputs({
    inputs: schema.inputs,
  });
  outputCommand += parseTracks({
    schema,
  });
  outputCommand += parseOutput({
    output: schema.output,
  });

  return outputCommand;
}
