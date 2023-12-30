import { VideoEditorFormat } from "./types/VideoEditingFormat";
import { calculateTotalLength } from "./calculateTotalLength";

export function parseOutput({ schema }: { schema: VideoEditorFormat }): string {
  let outputCommand = "";
  const totalLength = calculateTotalLength(schema.tracks);

  const {
    file,
    framerate,
    videoCodec,
    audioCodec,
    width,
    height,
    flags,
    audioBitrate,
    crf,
    preset,
  } = schema.output;

  const resolution = `${width}x${height}`;
  const additionalFlags = flags.length > 0 ? flags.join(" ") : "";

  outputCommand += `-map '[video_output]' -map '[audio_output]' -c:v ${videoCodec} -c:a ${audioCodec} -b:a ${audioBitrate} -r ${framerate} -s ${resolution} -t ${totalLength} -crf ${crf} -preset ${preset} ${additionalFlags} ${file}`;

  return outputCommand;
}
