function persistence(n: number): number {
  let steps = 0;
  while (n >= 10) {
    n = [...String(n)].reduce((acc, d) => acc * Number(d), 1);
    steps++;
  }
  return steps;
}

for (const n of [39, 77, 999, 10]) console.log(n, persistence(n));
