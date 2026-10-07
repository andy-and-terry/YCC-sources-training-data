export function isIsogram(word: string): boolean {
  const seen = new Set<string>();
  for (const ch of word.toLowerCase()) {
    if (!/[a-z]/.test(ch)) continue;
    if (seen.has(ch)) return false;
    seen.add(ch);
  }
  return true;
}

console.log(["lumberjacks", "background", "six-year-old", "isograms"].map(isIsogram));
