function longestPalindromicSubstring(s: string): string {
  if (s.length === 0) return '';

  const transformed = `^#${s.split('').join('#')}#$`;
  const n = transformed.length;
  const radius = new Array(n).fill(0);
  let center = 0;
  let right = 0;

  for (let i = 1; i < n - 1; i++) {
    if (i < right) {
      radius[i] = Math.min(right - i, radius[2 * center - i]);
    }
    while (transformed[i + radius[i] + 1] === transformed[i - radius[i] - 1]) {
      radius[i]++;
    }
    if (i + radius[i] > right) {
      center = i;
      right = i + radius[i];
    }
  }

  let maxLen = 0;
  let centerIndex = 0;
  for (let i = 1; i < n - 1; i++) {
    if (radius[i] > maxLen) {
      maxLen = radius[i];
      centerIndex = i;
    }
  }

  const start = (centerIndex - maxLen) / 2;
  return s.substring(start, start + maxLen);
}

console.log(longestPalindromicSubstring('babad'));
console.log(longestPalindromicSubstring('cbbd'));
console.log(longestPalindromicSubstring('forgeeksskeegfor'));
