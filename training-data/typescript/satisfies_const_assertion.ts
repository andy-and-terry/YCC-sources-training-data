const palette = {
  red: [255, 0, 0],
  green: "#00ff00",
} satisfies Record<string, string | number[]>;

const first = palette.red[0]; // still typed as number
const hex = palette.green.toUpperCase(); // still typed as string

const dirs = ["north", "south"] as const;
type Dir = (typeof dirs)[number];
const d: Dir = "north";
console.log(first, hex, d);
