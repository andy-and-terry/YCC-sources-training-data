function longestCommonSubstring(a: string, b: string): string {
  const dp: number[][] = Array.from({ length: a.length + 1 }, () => new Array(b.length + 1).fill(0));
  let maxLen = 0;
  let endIndex = 0;

  for (let i = 1; i <= a.length; i++) {
    for (let j = 1; j <= b.length; j++) {
      if (a[i - 1] === b[j - 1]) {
        dp[i][j] = dp[i - 1][j - 1] + 1;
        if (dp[i][j] > maxLen) {
          maxLen = dp[i][j];
          endIndex = i;
        }
      }
    }
  }
  return a.slice(endIndex - maxLen, endIndex);
}

console.log(longestCommonSubstring("abcdxyz", "xyzabcd")); // "abcd"
console.log(longestCommonSubstring("GeeksforGeeks", "GeeksQuiz")); // "Geeks"
