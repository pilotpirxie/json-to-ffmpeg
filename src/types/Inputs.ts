export type Inputs = {
  [key: string]: Source;
};

export type Source = {
  type: "video" | "audio" | "image";
  file: string;
  hasAudio: boolean;
  hasVideo: boolean;
  duration: number;
};
