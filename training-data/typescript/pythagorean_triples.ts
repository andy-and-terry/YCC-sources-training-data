function pythagoreanTriples(limit: number): [number, number, number][] {
  const result: [number, number, number][] = [];
  for (let a = 1; a < limit; a++) {
    for (let b = a; b < limit; b++) {
      const c = Math.sqrt(a * a + b * b);
      if (Number.isInteger(c) && c <= limit) {
        result.push([a, b, c]);
      }
    }
  }
  return result;
}

for (const [a, b, c] of pythagoreanTriples(30)) {
  console.log(`${a}^2 + ${b}^2 = ${c}^2`);
}
