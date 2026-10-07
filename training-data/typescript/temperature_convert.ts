type Unit = "C" | "F" | "K";

const toC: Record<Unit, (v: number) => number> = {
  C: (v) => v,
  F: (v) => ((v - 32) * 5) / 9,
  K: (v) => v - 273.15,
};
const fromC: Record<Unit, (v: number) => number> = {
  C: (v) => v,
  F: (v) => (v * 9) / 5 + 32,
  K: (v) => v + 273.15,
};

export const convert = (value: number, from: Unit, to: Unit): number => fromC[to](toC[from](value));

console.log(convert(37, "C", "F"), convert(0, "K", "C").toFixed(2));
