import { Output } from "./types/Output";

export function parseOutput({ output }: { output: Output }): string {
  let outputCommand = "";

  const { file, bitrate, framerate, videoCodec, audioCodec, width, height } =
    output;

  const resolution = `${width}x${height}`;

  outputCommand += `-map [video_output] -map [audio_output] -c:v ${videoCodec} -c:a ${audioCodec} -b:v ${bitrate} -r ${framerate} -s ${resolution} ${file}`;

  return outputCommand;
}
