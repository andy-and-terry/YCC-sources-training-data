function primesUpTo(n: number): number[] {
  const is: boolean[] = new Array(n + 1).fill(true);
  is[0] = is[1] = false;
  for (let i = 2; i * i <= n; i++)
    if (is[i]) for (let j = i * i; j <= n; j += i) is[j] = false;
  return is.flatMap((p, i) => (p ? [i] : []));
}
const ps = primesUpTo(50);
const twins: [number, number][] = [];
for (let i = 1; i < ps.length; i++) if (ps[i] - ps[i - 1] === 2) twins.push([ps[i - 1], ps[i]]);
console.log(twins);
