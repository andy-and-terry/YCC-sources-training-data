const COLORS = ["red", "green", "blue"] as const;
type Color = (typeof COLORS)[number];

type Head<T extends readonly unknown[]> = T extends readonly [infer H, ...unknown[]] ? H : never;
type Tail<T extends readonly unknown[]> = T extends readonly [unknown, ...infer R] ? R : [];
type Last<T extends readonly unknown[]> = T extends readonly [...unknown[], infer L] ? L : never;

type First = Head<typeof COLORS>;
type Rest = Tail<typeof COLORS>;
type End = Last<typeof COLORS>;

function isColor(value: string): value is Color {
  return (COLORS as readonly string[]).includes(value);
}

const first: First = "red";
const rest: Rest = ["green", "blue"];
const end: End = "blue";
console.log(first, rest, end, isColor("green"), isColor("pink"));
