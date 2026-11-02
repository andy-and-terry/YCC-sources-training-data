const dirs = ["N", "E", "S", "W"] as const;
type Dir = (typeof dirs)[number];
const turn = (d: Dir): Dir => dirs[(dirs.indexOf(d) + 1) % 4];
console.log(turn("W"));
