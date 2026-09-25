export function isArmstrong(n: number): boolean {
  const digits = String(n);
  const k = digits.length;
  let sum = 0;
  for (const d of digits) sum += Number(d) ** k;
  return sum === n;
}

function* armstrongNumbers(limit: number): Generator<number> {
  for (let n = 1; n < limit; n++) if (isArmstrong(n)) yield n;
}

console.log([...armstrongNumbers(100000)]);
