import { Inputs } from "../types/Inputs";

export function findInputIndex(inputs: Inputs, inputName: string): number {
  const inputNames = Object.keys(inputs);
  return inputNames.indexOf(inputName);
}
