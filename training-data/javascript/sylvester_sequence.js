// Sylvester's sequence: s(0) = 2, s(n+1) = s(n)^2 - s(n) + 1 (BigInt: it grows doubly exponentially)
let s = 2n;
for (let i = 0; i < 8; i++) {
  console.log(`s(${i}) = ${s}`);
  s = s * s - s + 1n;
}
