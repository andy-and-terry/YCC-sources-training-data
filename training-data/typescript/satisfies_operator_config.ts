// `satisfies` validates a value against a type while keeping its narrow inferred type.
type Colors = Record<string, string | [number, number, number]>;

const palette = {
  red: [255, 0, 0],
  green: "#00ff00",
} satisfies Colors;

console.log(palette.red.map((c) => c / 255)); // still a tuple, not string | tuple
console.log(palette.green.toUpperCase());
