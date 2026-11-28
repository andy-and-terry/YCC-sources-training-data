function isHappy(start: number): boolean {
  const seen = new Set<number>();
  let n = start;
  while (n !== 1 && !seen.has(n)) {
    seen.add(n);
    n = [...String(n)].reduce((s, d) => s + Number(d) ** 2, 0);
  }
  return n === 1;
}

const found: number[] = [];
for (let n = 1; found.length < 8; n++) if (isHappy(n)) found.push(n);
console.log(found); // [1, 7, 10, 13, 19, 23, 28, 31]
