/** LPS(s) equals LCS(s, reverse(s)); computed with two rolling rows. */
export function lps(s: string): number {
  const t = [...s].reverse().join("");
  let prev = new Array<number>(t.length + 1).fill(0);
  for (const a of s) {
    const cur = [0];
    for (let j = 1; j <= t.length; j++) cur[j] = a === t[j - 1] ? prev[j - 1] + 1 : Math.max(prev[j], cur[j - 1]);
    prev = cur;
  }
  return prev[t.length];
}

export const minInsertionsToPalindrome = (s: string): number => s.length - lps(s);

for (const s of ["bbbab", "character", "agbdba", "leetcode"]) console.log(s, lps(s), minInsertionsToPalindrome(s));
