type Color = "red" | "green" | [number, number, number];

const palette = {
  primary: "red",
  accent: [0, 255, 0],
} satisfies Record<string, Color>;

console.log(palette.primary.toUpperCase());
console.log(palette.accent.map((n) => n / 255));
