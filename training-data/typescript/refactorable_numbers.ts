const tau = (n: number): number => {
  let c = 0;
  for (let d = 1; d <= n; d++) if (n % d === 0) c++;
  return c;
};
const out: number[] = [];
for (let n = 1; n < 60; n++) if (n % tau(n) === 0) out.push(n);
console.log(out.join(" ")); // 1 2 8 9 12 18 24 36 40 56
