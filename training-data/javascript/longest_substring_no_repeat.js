function longestUnique(s) {
  const last = new Map();
  let start = 0, bestStart = 0, bestLen = 0;
  for (let i = 0; i < s.length; i++) {
    if (last.has(s[i]) && last.get(s[i]) >= start) start = last.get(s[i]) + 1;
    last.set(s[i], i);
    if (i + 1 - start > bestLen) { bestLen = i + 1 - start; bestStart = start; }
  }
  return s.slice(bestStart, bestStart + bestLen);
}

for (const s of ["abcabcbb", "bbbbb", "pwwkew", "dvdf"]) {
  const r = longestUnique(s);
  console.log(s, r, r.length);
}
module.exports = { longestUnique };
