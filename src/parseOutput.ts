import { VideoEditorFormat } from "./types/VideoEditingFormat";
import { calculateTotalLength } from "./calculateTotalLength";

export function parseOutput({ schema }: { schema: VideoEditorFormat }): string {
  let outputCommand = "";
  const totalLength = calculateTotalLength(schema.tracks);

  const {
    file,
    bitrate,
    framerate,
    videoCodec,
    audioCodec,
    width,
    height,
    flags,
  } = schema.output;

  const resolution = `${width}x${height}`;
  const additionalFlags = flags.length > 0 ? flags.join(" ") : "";

  outputCommand += `-map '[video_output]' -map '[audio_output]' -c:v ${videoCodec} -c:a ${audioCodec} -b:v ${bitrate} -r ${framerate} -s ${resolution} -t ${totalLength} ${additionalFlags} ${file}`;

  return outputCommand;
}
