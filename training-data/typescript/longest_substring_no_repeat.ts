export function longestUnique(s: string): { start: number; length: number; text: string } {
  const last = new Map<string, number>();
  let start = 0, bestStart = 0, bestLen = 0;
  [...s].forEach((c, i) => {
    const prev = last.get(c);
    if (prev !== undefined && prev >= start) start = prev + 1;
    last.set(c, i);
    if (i + 1 - start > bestLen) {
      bestLen = i + 1 - start;
      bestStart = start;
    }
  });
  return { start: bestStart, length: bestLen, text: s.slice(bestStart, bestStart + bestLen) };
}

for (const s of ["abcabcbb", "bbbbb", "pwwkew", "dvdf"]) console.log(s, longestUnique(s));
