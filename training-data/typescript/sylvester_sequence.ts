// Sylvester's sequence: s(0) = 2, s(n+1) = s(n)^2 - s(n) + 1
function* sylvester(): Generator<bigint> {
  let s = 2n;
  while (true) {
    yield s;
    s = s * s - s + 1n;
  }
}

let i = 0;
for (const s of sylvester()) {
  if (i === 8) break;
  console.log(`s(${i++}) = ${s}`);
}
