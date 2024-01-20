import { InputFiles } from "../types/InputFiles";

export function findInputIndex(inputFiles: InputFiles, name: string): number {
  return inputFiles.findIndex((inputFile) => inputFile.name === name);
}
