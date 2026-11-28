function isHappy(n) {
  const seen = new Set();
  while (n !== 1 && !seen.has(n)) {
    seen.add(n);
    n = String(n).split("").reduce((s, d) => s + d * d, 0);
  }
  return n === 1;
}

const found = [];
for (let n = 1; found.length < 8; n++) if (isHappy(n)) found.push(n);
console.log(found.join(" ")); // 1 7 10 13 19 23 28 31
