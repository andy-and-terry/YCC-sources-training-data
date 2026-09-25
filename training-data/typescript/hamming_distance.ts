export function hammingString(a: string, b: string): number {
  if (a.length !== b.length) throw new RangeError("strings must have equal length");
  let d = 0;
  for (let i = 0; i < a.length; i++) if (a[i] !== b[i]) d++;
  return d;
}

export function popcount(v: number): number {
  v = v >>> 0;
  let c = 0;
  for (; v; c++) v &= v - 1;
  return c;
}

export const hammingInt = (x: number, y: number): number => popcount(x ^ y);

console.log(hammingString("karolin", "kathrin"), hammingInt(1, 4), hammingInt(255, 0));
