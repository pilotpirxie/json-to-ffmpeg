import { VideoEditorFormat } from "./types/VideoEditingFormat";
import { parseInputs } from "./parseInputs";
import { parseTracks } from "./parseTracks";
import { parseOutput } from "./parseOutput";
import { preprocessClips } from "./preprocessClips";
import { InputFiles } from "./types/InputFiles";

export function parseSchema(
  schema: VideoEditorFormat,
  onlyFilterComplex: boolean = false,
): string {
  let outputCommand = "#!/bin/bash\n";
  const inputFiles: InputFiles = [];

  outputCommand += preprocessClips({
    schema,
  });

  outputCommand += "ffmpeg -y \\\n";

  const inputsResult = parseInputs({
    schema,
  });

  outputCommand += inputsResult.command;
  inputFiles.push(...inputsResult.inputFiles);

  outputCommand += '-filter_complex "';

  const filterComplex = parseTracks({
    schema,
    inputFiles,
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
