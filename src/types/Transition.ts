export type Transition = {
  type: "fade";
  from: string;
  to: string;
  position: "start" | "end";
  duration: number;
};
