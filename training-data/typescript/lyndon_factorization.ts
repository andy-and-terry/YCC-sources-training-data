function duval(s: string): string[] {
  const out: string[] = [];
  let i = 0;
  while (i < s.length) {
    let j = i + 1, k = i;
    while (j < s.length && s[k] <= s[j]) {
      k = s[k] < s[j] ? i : k + 1;
      j++;
    }
    while (i <= k) {
      out.push(s.slice(i, i + j - k));
      i += j - k;
    }
  }
  return out;
}
console.log(duval("banana"));
