type Point = [x: number, y: number, label?: string];
type LogArgs = [level: "info" | "warn", ...messages: string[]];
type Head<T extends unknown[]> = T extends [infer H, ...unknown[]] ? H : never;
type Tail<T extends unknown[]> = T extends [unknown, ...infer R] ? R : [];

function log(...args: LogArgs): void {
  const [level, ...messages] = args;
  console.log(`[${level}]`, messages.join(" "));
}

function describe(p: Point): string {
  const [x, y, label = "point"] = p;
  return `${label}(${x}, ${y})`;
}

const pair: [string, number] = ["age", 30];
const [key, value] = pair;
type H = Head<[string, number, boolean]>;
type T = Tail<[string, number, boolean]>;
const h: H = "first";
const t: T = [1, true];

log("info", "server", "started");
log("warn", "disk almost full");
console.log(describe([1, 2]), describe([3, 4, "origin"]));
console.log(key, value, h, t);
