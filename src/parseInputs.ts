import { Inputs } from "./types/Inputs";

/**
 * Return all the inputs as a part of ffmpeg command.
 * @param inputs
 */
export function parseInputs({ inputs }: { inputs: Inputs }): string {
  let inputsCommand = "";

  for (const [, value] of Object.entries(inputs)) {
    inputsCommand += `-i ${value.file} \\\n`;
  }

  return inputsCommand;
}
