export function minWindow(s: string, t: string): string {
  const need = new Map<string, number>();
  for (const c of t) need.set(c, (need.get(c) ?? 0) + 1);
  let missing = t.length;
  let best: [number, number] = [0, Infinity];
  for (let left = 0, right = 0; right < s.length; right++) {
    const c = s[right];
    if ((need.get(c) ?? 0) > 0) missing--;
    need.set(c, (need.get(c) ?? 0) - 1);
    while (missing === 0) {
      if (right + 1 - left < best[1] - best[0]) best = [left, right + 1];
      const l = s[left++];
      need.set(l, need.get(l)! + 1);
      if (need.get(l)! > 0) missing++;
    }
  }
  return best[1] === Infinity ? "" : s.slice(best[0], best[1]);
}

console.log(minWindow("ADOBECODEBANC", "ABC"), JSON.stringify(minWindow("a", "aa")));
