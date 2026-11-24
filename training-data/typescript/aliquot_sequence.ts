// Aliquot sequence: repeatedly replace n by the sum of its proper divisors.
const aliquotSum = (n: number): number => {
  let s = 0;
  for (let d = 1; d <= n / 2; d++) if (n % d === 0) s += d;
  return s;
};
const seq: number[] = [12];
while (seq[seq.length - 1] > 1 && seq.length < 20) seq.push(aliquotSum(seq[seq.length - 1]));
console.log(seq.join(" "));
