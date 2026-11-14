const palette = {
  red: [255, 0, 0],
  green: "#00ff00",
} satisfies Record<string, string | number[]>;

console.log(palette.red.map((n) => n / 255), palette.green.toUpperCase());
