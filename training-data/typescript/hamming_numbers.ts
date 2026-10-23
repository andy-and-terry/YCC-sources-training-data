// Hamming numbers (5-smooth), built by merging the x2, x3, x5 streams
const h: number[] = [1];
let i2 = 0, i3 = 0, i5 = 0;
while (h.length < 20) {
  const next = Math.min(h[i2] * 2, h[i3] * 3, h[i5] * 5);
  h.push(next);
  if (next === h[i2] * 2) i2++;
  if (next === h[i3] * 3) i3++;
  if (next === h[i5] * 5) i5++;
}
console.log(h.join(" "));
