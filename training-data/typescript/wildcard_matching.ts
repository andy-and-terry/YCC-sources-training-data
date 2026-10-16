function isWildcardMatch(text: string, pattern: string): boolean {
  const dp: boolean[][] = Array.from({ length: text.length + 1 }, () =>
    new Array<boolean>(pattern.length + 1).fill(false),
  );
  dp[0][0] = true;
  for (let j = 1; j <= pattern.length; j++) {
    if (pattern[j - 1] === "*") dp[0][j] = dp[0][j - 1];
  }
  for (let i = 1; i <= text.length; i++) {
    for (let j = 1; j <= pattern.length; j++) {
      const p = pattern[j - 1];
      if (p === "*") dp[i][j] = dp[i - 1][j] || dp[i][j - 1];
      else if (p === "?" || p === text[i - 1]) dp[i][j] = dp[i - 1][j - 1];
    }
  }
  return dp[text.length][pattern.length];
}

console.log(isWildcardMatch("adceb", "*a*b"));
console.log(isWildcardMatch("acdcb", "a*c?b"));
console.log(isWildcardMatch("", "***"));
