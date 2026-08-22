function rabinKarp(text, pattern, base = 256, mod = 1_000_000_007) {
  const n = text.length;
  const m = pattern.length;
  if (m > n) return [];

  const highOrder = BigInt(base) ** BigInt(m - 1) % BigInt(mod);
  let patternHash = 0n;
  let windowHash = 0n;
  for (let i = 0; i < m; i++) {
    patternHash = (patternHash * BigInt(base) + BigInt(pattern.charCodeAt(i))) % BigInt(mod);
    windowHash = (windowHash * BigInt(base) + BigInt(text.charCodeAt(i))) % BigInt(mod);
  }

  const matches = [];
  for (let i = 0; i <= n - m; i++) {
    if (windowHash === patternHash && text.slice(i, i + m) === pattern) matches.push(i);
    if (i < n - m) {
      windowHash =
        ((windowHash - BigInt(text.charCodeAt(i)) * highOrder) * BigInt(base) +
          BigInt(text.charCodeAt(i + m))) %
        BigInt(mod);
      if (windowHash < 0n) windowHash += BigInt(mod);
    }
  }
  return matches;
}

console.log(rabinKarp('abxabcabcaby', 'abcaby'));
module.exports = { rabinKarp };
