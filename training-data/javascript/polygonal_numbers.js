// n-th s-gonal number: ((s - 2) n^2 - (s - 4) n) / 2
const polygonal = (s, n) => ((s - 2) * n * n - (s - 4) * n) / 2;

const kinds = { triangular: 3, pentagonal: 5, hexagonal: 6 };
for (const [name, s] of Object.entries(kinds)) {
  const nums = Array.from({ length: 10 }, (_, i) => polygonal(s, i + 1));
  console.log(`${name}: ${nums.join(" ")}`);
}
