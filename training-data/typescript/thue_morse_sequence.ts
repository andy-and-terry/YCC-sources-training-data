// Thue-Morse: t(n) is the parity of the number of 1 bits in n
function thueMorse(n: number): number {
  let parity = 0;
  for (; n > 0; n >>= 1) parity ^= n & 1;
  return parity;
}

const out: number[] = [];
for (let n = 0; n < 32; n++) out.push(thueMorse(n));
console.log(out.join(""));
