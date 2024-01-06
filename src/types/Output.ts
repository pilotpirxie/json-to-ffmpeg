export type Output = {
  file: string;
  videoCodec: string;
  audioCodec: string;
  width: number;
  height: number;
  audioBitrate: string;
  preset: string;
  crf: number;
  framerate: number;
  flags: string[];
  startPosition: number;
  endPosition: number;
  scaleRatio: number;
};
