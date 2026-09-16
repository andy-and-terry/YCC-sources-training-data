function wordBreak(s: string, wordDict: string[]): boolean {
  const words = new Set<string>(wordDict);
  const n = s.length;
  const dp: boolean[] = new Array(n + 1).fill(false);
  dp[0] = true;

  for (let end = 1; end <= n; end++) {
    for (let start = 0; start < end; start++) {
      if (dp[start] && words.has(s.substring(start, end))) {
        dp[end] = true;
        break;
      }
    }
  }
  return dp[n];
}

function wordBreakAll(s: string, wordDict: string[]): string[][] {
  const words = new Set<string>(wordDict);
  const memo = new Map<number, string[][]>();

  function backtrack(start: number): string[][] {
    if (start === s.length) return [[]];
    if (memo.has(start)) return memo.get(start)!;

    const results: string[][] = [];
    for (let end = start + 1; end <= s.length; end++) {
      const word = s.substring(start, end);
      if (words.has(word)) {
        for (const rest of backtrack(end)) {
          results.push([word, ...rest]);
        }
      }
    }
    memo.set(start, results);
    return results;
  }

  return backtrack(0).map((words) => words.join(" "));
}

console.log(wordBreak("leetcode", ["leet", "code"]));
console.log(wordBreak("catsandog", ["cats", "dog", "sand", "and", "cat"]));
console.log(wordBreakAll("catsanddog", ["cat", "cats", "and", "sand", "dog"]));
