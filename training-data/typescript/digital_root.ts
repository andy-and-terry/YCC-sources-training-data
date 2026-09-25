export function digitalRootLoop(n: number): number {
  while (n >= 10) n = [...String(n)].reduce((a, d) => a + Number(d), 0);
  return n;
}

export const digitalRoot = (n: number): number => (n === 0 ? 0 : 1 + ((n - 1) % 9));

for (const n of [0, 16, 942, 132189, 493193]) {
  if (digitalRoot(n) !== digitalRootLoop(n)) throw new Error(`mismatch at ${n}`);
  console.log(n, digitalRoot(n));
}
