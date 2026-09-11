function longestPalindrome(s) {
  if (s.length === 0) return "";

  // Transform: "abc" -> "^#a#b#c#$" so every palindrome (odd or even) has odd length.
  const transformed = `^#${s.split("").join("#")}#$`;
  const n = transformed.length;
  const p = new Array(n).fill(0);
  let center = 0;
  let right = 0;

  for (let i = 1; i < n - 1; i++) {
    if (i < right) {
      p[i] = Math.min(right - i, p[2 * center - i]);
    }
    while (transformed[i + p[i] + 1] === transformed[i - p[i] - 1]) {
      p[i]++;
    }
    if (i + p[i] > right) {
      center = i;
      right = i + p[i];
    }
  }

  let maxLen = 0;
  let centerIndex = 0;
  for (let i = 1; i < n - 1; i++) {
    if (p[i] > maxLen) {
      maxLen = p[i];
      centerIndex = i;
    }
  }

  const start = (centerIndex - maxLen) / 2;
  return s.slice(start, start + maxLen);
}

console.log(longestPalindrome("babad"));
console.log(longestPalindrome("cbbd"));
console.log(longestPalindrome("racecar"));

module.exports = { longestPalindrome };
