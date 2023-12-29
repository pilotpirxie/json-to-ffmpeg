import { Clip } from "./Clip";

export type Tracks = {
  [key: string]: Track;
};

export type Track = {
  clips: Clip[];
};
