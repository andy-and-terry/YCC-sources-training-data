function ugly(n: number): number {
  const seq: number[] = [1];
  let i2 = 0, i3 = 0, i5 = 0;
  while (seq.length < n) {
    const next = Math.min(seq[i2] * 2, seq[i3] * 3, seq[i5] * 5);
    seq.push(next);
    if (next === seq[i2] * 2) i2++;
    if (next === seq[i3] * 3) i3++;
    if (next === seq[i5] * 5) i5++;
  }
  return seq[n - 1];
}

console.log(Array.from({ length: 12 }, (_, i) => ugly(i + 1)).join(" "));
