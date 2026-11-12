const pair = [1, "a"] as const;
type Pair = typeof pair;
const modes = ["r", "w"] as const;
type Mode = (typeof modes)[number];
const m: Mode = "w";
const p: Pair = [1, "a"];
console.log(m, p);
