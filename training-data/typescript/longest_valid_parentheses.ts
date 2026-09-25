/** Two-pass counter approach: O(n) time, O(1) space. */
export function longestValid(s: string): number {
  let best = 0;
  const scan = (chars: string[], open: string): void => {
    let l = 0, r = 0;
    for (const c of chars) {
      if (c === open) l++;
      else r++;
      if (l === r) best = Math.max(best, 2 * r);
      else if (r > l) l = r = 0;
    }
  };
  scan([...s], "(");
  scan([...s].reverse(), ")");
  return best;
}

for (const s of ["(()", ")()())", "", "()(()", "((()))()"]) console.log(JSON.stringify(s), longestValid(s));
