type Level = "debug" | "info" | "error";
const weights: Record<Level, number> = { debug: 10, info: 20, error: 40 };
const max = (ls: Level[]) => ls.reduce((a, b) => (weights[a] >= weights[b] ? a : b));
console.log(max(["debug", "error", "info"]));
