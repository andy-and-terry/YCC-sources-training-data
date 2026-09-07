function rabinKarpSearch(text: string, pattern: string): number[] {
  const matches: number[] = [];
  const n = text.length;
  const m = pattern.length;
  if (m === 0 || m > n) return matches;

  const base = 256;
  const mod = 1_000_000_007;
  let highOrder = 1;
  for (let i = 0; i < m - 1; i++) highOrder = (highOrder * base) % mod;

  let patternHash = 0;
  let windowHash = 0;
  for (let i = 0; i < m; i++) {
    patternHash = (patternHash * base + pattern.charCodeAt(i)) % mod;
    windowHash = (windowHash * base + text.charCodeAt(i)) % mod;
  }

  for (let i = 0; i <= n - m; i++) {
    if (patternHash === windowHash && text.slice(i, i + m) === pattern) {
      matches.push(i);
    }
    if (i < n - m) {
      windowHash = (windowHash - text.charCodeAt(i) * highOrder) % mod;
      windowHash = (windowHash * base + text.charCodeAt(i + m)) % mod;
      windowHash = ((windowHash % mod) + mod) % mod;
    }
  }
  return matches;
}

console.log(rabinKarpSearch('abxabcabcaby', 'abcaby'));
console.log(rabinKarpSearch('aaaaa', 'aa'));
