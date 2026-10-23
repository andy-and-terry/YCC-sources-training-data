function isHarshad(n: number): boolean {
  const sum = [...String(n)].reduce((a, d) => a + Number(d), 0);
  return n > 0 && n % sum === 0;
}

const out: number[] = [];
for (let n = 1; n < 50; n++) if (isHarshad(n)) out.push(n);
console.log(out.join(" "));
