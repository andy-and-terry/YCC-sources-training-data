function isRegexMatch(s: string, p: string): boolean {
  const memo = new Map<string, boolean>();
  const go = (i: number, j: number): boolean => {
    const key = `${i},${j}`;
    const cached = memo.get(key);
    if (cached !== undefined) return cached;
    let result: boolean;
    if (j === p.length) {
      result = i === s.length;
    } else {
      const first = i < s.length && (p[j] === s[i] || p[j] === ".");
      if (j + 1 < p.length && p[j + 1] === "*") {
        result = go(i, j + 2) || (first && go(i + 1, j));
      } else {
        result = first && go(i + 1, j + 1);
      }
    }
    memo.set(key, result);
    return result;
  };
  return go(0, 0);
}

console.log(isRegexMatch("aab", "c*a*b"));
console.log(isRegexMatch("mississippi", "mis*is*p*."));
console.log(isRegexMatch("ab", ".*c"));
