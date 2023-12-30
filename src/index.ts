import { VideoEditorFormat } from "./types/VideoEditingFormat";
import { parseInputs } from "./parseInputs";
import { parseTracks } from "./parseTracks";
import { parseOutput } from "./parseOutput";

export function parseSchema(
  schema: VideoEditorFormat,
  onlyFilterComplex: boolean = false,
): string {
  let outputCommand = "#!/bin/bash\n";

  outputCommand += "ffmpeg -y \\\n";

  outputCommand += parseInputs({
    inputs: schema.inputs,
  });

  outputCommand += '-filter_complex "';

  const filterComplex = parseTracks({
    schema,
  });

  if (onlyFilterComplex) {
    return filterComplex;
  }

  outputCommand += filterComplex;
  outputCommand += '" \\\n';
  outputCommand += parseOutput({
    schema,
  });

  return outputCommand;
}
