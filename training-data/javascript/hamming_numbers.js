// Hamming numbers (5-smooth): only prime factors 2, 3 and 5
function isHamming(n) {
  for (const p of [2, 3, 5]) while (n % p === 0) n /= p;
  return n === 1;
}

const found = [];
for (let n = 1; found.length < 20; n++) if (isHamming(n)) found.push(n);
console.log(found.join(" "));
