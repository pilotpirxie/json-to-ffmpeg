import { Inputs, Source } from "../types/Inputs";

export function findInput(inputs: Inputs, inputName: string): Source {
  return inputs[inputName];
}
