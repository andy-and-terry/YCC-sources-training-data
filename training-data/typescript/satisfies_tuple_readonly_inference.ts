const palette = {
  red: [255, 0, 0],
  green: "#00ff00",
} satisfies Record<string, string | number[]>;

const first = palette.red[0].toFixed(1);
const pair: readonly [string, number] = ["x", 1];
console.log(first, palette.green.toUpperCase(), pair[1]);
