import { Transform } from "./Transform";
import { Transition } from "./Transition";

export type ImageClip = {
  name: string;
  source: string;
  start: number;
  duration: number;
  offset: number;
  clipType: "image";
  transform: Transform;
};

export type VideoClip = {
  name: string;
  source: string;
  start: number;
  duration: number;
  offset: number;
  clipType: "video";
  transform: Transform;
  transitions: Transition[];
};

export type AudioClip = {
  name: string;
  source: string;
  start: number;
  duration: number;
  offset: number;
  clipType: "audio";
  volume: number;
};

export type Clip = VideoClip | AudioClip | ImageClip;
