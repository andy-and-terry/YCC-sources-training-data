function nthUgly(n) {
  const u = [1];
  let i2 = 0, i3 = 0, i5 = 0;
  while (u.length < n) {
    const nx = Math.min(u[i2] * 2, u[i3] * 3, u[i5] * 5);
    u.push(nx);
    if (nx === u[i2] * 2) i2++;
    if (nx === u[i3] * 3) i3++;
    if (nx === u[i5] * 5) i5++;
  }
  return u[n - 1];
}

console.log(Array.from({ length: 15 }, (_, i) => nthUgly(i + 1)).join(" "));
