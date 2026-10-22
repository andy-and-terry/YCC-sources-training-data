function properDivisorSum(n: number): number {
  let total = 0;
  for (let d = 1; d < n; d++) if (n % d === 0) total += d;
  return total;
}

function aliquot(start: number): number[] {
  const seq: number[] = [start];
  while (seq[seq.length - 1] !== 0) seq.push(properDivisorSum(seq[seq.length - 1]));
  return seq;
}

console.log(aliquot(12).join(" "));
