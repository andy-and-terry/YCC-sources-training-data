function windowHashes(s: string, k: number, B = 31, M = 1000003): number[] {
  let pw = 1;
  for (let i = 1; i < k; i++) pw = (pw * B) % M;
  let h = 0;
  for (let i = 0; i < k; i++) h = (h * B + s.charCodeAt(i)) % M;
  const out = [h];
  for (let i = 1; i + k <= s.length; i++) {
    h = (h - ((s.charCodeAt(i - 1) * pw) % M) + M) % M;
    h = (h * B + s.charCodeAt(i + k - 1)) % M;
    out.push(h);
  }
  return out;
}
console.log(windowHashes("abcabc", 3));
