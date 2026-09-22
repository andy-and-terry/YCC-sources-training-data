function longestPalindrome(s: string): string {
  if (s.length === 0) return "";

  // Transform "abc" -> "^#a#b#c#$" to handle even/odd length uniformly.
  const t = "^#" + s.split("").join("#") + "#$";
  const p: number[] = new Array(t.length).fill(0);
  let center = 0;
  let right = 0;

  for (let i = 1; i < t.length - 1; i++) {
    if (i < right) {
      p[i] = Math.min(right - i, p[2 * center - i]);
    }
    while (t[i + p[i] + 1] === t[i - p[i] - 1]) {
      p[i]++;
    }
    if (i + p[i] > right) {
      center = i;
      right = i + p[i];
    }
  }

  let maxLen = 0;
  let centerIndex = 0;
  for (let i = 1; i < t.length - 1; i++) {
    if (p[i] > maxLen) {
      maxLen = p[i];
      centerIndex = i;
    }
  }
  const start = (centerIndex - maxLen) / 2;
  return s.slice(start, start + maxLen);
}

console.log(longestPalindrome("babad")); // "bab" (or "aba")
console.log(longestPalindrome("cbbd"));  // "bb"
