// Fibbinary numbers: no two adjacent 1 bits in the binary representation.
const out = [];
for (let n = 0; n < 50; n++) if ((n & (n >> 1)) === 0) out.push(n);
console.log(out.join(" "));
