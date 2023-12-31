import { Transform } from "./Transform";

export type ImageClip = {
  name: string;
  source: string;
  timelineTrackStart: number;
  duration: number;
  sourceStartOffset: number;
  clipType: "image";
  transform: Transform;
};

export type VideoClip = {
  name: string;
  source: string;
  timelineTrackStart: number;
  duration: number;
  sourceStartOffset: number;
  clipType: "video";
  transform: Transform;
};

export type AudioClip = {
  name: string;
  source: string;
  timelineTrackStart: number;
  duration: number;
  sourceStartOffset: number;
  clipType: "audio";
  volume: number;
};

export type Clip = VideoClip | AudioClip | ImageClip;
