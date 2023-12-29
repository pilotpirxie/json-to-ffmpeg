import { Inputs } from "./types/Inputs";

export function parseInputs({ inputs }: { inputs: Inputs }): string {
  let inputsCommand = "";

  for (const [, value] of Object.entries(inputs)) {
    inputsCommand += `-i ${value.file}\n`;
  }

  return inputsCommand;
}
