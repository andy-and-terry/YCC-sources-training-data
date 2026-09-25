export function countWays(n: number, steps: readonly number[] = [1, 2]): bigint {
  const ways: bigint[] = new Array(n + 1).fill(0n);
  ways[0] = 1n;
  for (let i = 1; i <= n; i++) for (const s of steps) if (s <= i) ways[i] += ways[i - s];
  return ways[n];
}

export function listWays(n: number, steps: readonly number[] = [1, 2]): number[][] {
  if (n === 0) return [[]];
  return steps.filter((s) => s <= n).flatMap((s) => listWays(n - s, steps).map((rest) => [s, ...rest]));
}

console.log(Array.from({ length: 10 }, (_, i) => countWays(i + 1)).join(" "));
console.log(countWays(100).toString());
console.log(listWays(4).map((w) => w.join("+")));
