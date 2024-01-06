export type Transition = {
  type: string;
  from: string | null;
  to: string | null;
  duration: number;
};
