const fact: number[] = [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880];

function isFactorion(n: number): boolean {
  return n === [...String(n)].reduce((s, d) => s + fact[Number(d)], 0);
}

const found: number[] = [];
for (let n = 1; n < 50000; n++) if (isFactorion(n)) found.push(n);
console.log(found);
