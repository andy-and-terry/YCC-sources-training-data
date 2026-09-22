function longestPalindromicSubstring(input: string): string {
  if (input.length === 0) return "";

  const transformed = `^#${input.split("").join("#")}#$`;
  const n = transformed.length;
  const radius: number[] = new Array(n).fill(0);
  let center = 0;
  let rightEdge = 0;

  for (let i = 1; i < n - 1; i++) {
    const mirror = 2 * center - i;
    if (i < rightEdge) {
      radius[i] = Math.min(rightEdge - i, radius[mirror]);
    }
    while (transformed[i + radius[i] + 1] === transformed[i - radius[i] - 1]) {
      radius[i]++;
    }
    if (i + radius[i] > rightEdge) {
      center = i;
      rightEdge = i + radius[i];
    }
  }

  let maxLength = 0;
  let centerIndex = 0;
  for (let i = 1; i < n - 1; i++) {
    if (radius[i] > maxLength) {
      maxLength = radius[i];
      centerIndex = i;
    }
  }

  const start = (centerIndex - maxLength) / 2;
  return input.substring(start, start + maxLength);
}

console.log(longestPalindromicSubstring("babad"));
console.log(longestPalindromicSubstring("cbbd"));
console.log(longestPalindromicSubstring("racecarxyz"));
