import { VideoEditorFormat } from "./types/VideoEditingFormat";
import { parseInputs } from "./parseInputs";
import { parseTracks } from "./parseTracks";
import { parseOutput } from "./parseOutput";

export function parseSchema(schema: VideoEditorFormat): string {
  let outputCommand = "#!/bin/bash\n";

  outputCommand += "ffmpeg \\\n";

  outputCommand += parseInputs({
    inputs: schema.inputs,
  });

  outputCommand += '-filter_complex "';

  outputCommand += parseTracks({
    schema,
  });

  outputCommand += '" \\\n';
  outputCommand += parseOutput({
    output: schema.output,
  });

  return outputCommand;
}
