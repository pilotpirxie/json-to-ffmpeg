import { Inputs } from "./Inputs";
import { Output } from "./Output";
import { Tracks } from "./Tracks";
import { Transition } from "./Transition";

export type VideoEditorFormat = {
  version: number;
  inputs: Inputs;
  tracks: Tracks;
  output: Output;
  transitions: Transition[];
};
