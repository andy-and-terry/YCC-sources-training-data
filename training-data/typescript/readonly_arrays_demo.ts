function sum(values: readonly number[]): number {
  return values.reduce((a, b) => a + b, 0);
}

const nums: readonly number[] = [3, 1, 2];
// nums.push(4);   // error: push does not exist on readonly number[]
const sorted = [...nums].sort((a, b) => a - b);
console.log(sum(nums), sorted, nums);

const point = [10, 20] as const;
type Point = typeof point; // readonly [10, 20]
const [px, py]: Point = point;
console.log(px + py);

function frozenCopy<T>(items: T[]): ReadonlyArray<T> {
  return Object.freeze([...items]);
}

const frozen = frozenCopy(["a", "b"]);
try {
  (frozen as string[]).push("c");
} catch (e) {
  console.log((e as Error).constructor.name);
}

interface Config {
  readonly host: string;
  readonly ports: readonly number[];
}

const cfg: Config = { host: "localhost", ports: [80, 443] };
console.log(cfg.ports.map((p) => `${cfg.host}:${p}`));

type Mutable<T> = { -readonly [K in keyof T]: T[K] };
const draft: Mutable<Config> = { host: "a", ports: [1] };
draft.host = "b";
console.log(draft);
