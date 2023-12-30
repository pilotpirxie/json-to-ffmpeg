import { VideoEditorFormat } from "./types/VideoEditingFormat";
import { parseInputs } from "./parseInputs";
import { parseTracks } from "./parseTracks";
import { parseOutput } from "./parseOutput";

export function parseSchema(schema: VideoEditorFormat): string {
  let outputCommand = "#!/bin/bash\n";

  outputCommand += "ffmpeg -y \\\n";

  outputCommand += parseInputs({
    inputs: schema.inputs,
  });

  outputCommand += '-filter_complex "';

  outputCommand += parseTracks({
    schema,
  });

  outputCommand += '" \\\n';
  outputCommand += parseOutput({
    schema,
  });

  return outputCommand;
}
