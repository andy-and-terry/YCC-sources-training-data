export function longestCommonPrefix(words: readonly string[]): string {
  if (words.length === 0) return "";
  let i = 0;
  const first = words[0];
  while (i < first.length && words.every((w) => w[i] === first[i])) i++;
  return first.slice(0, i);
}

console.log(longestCommonPrefix(["flower", "flow", "flight"]));
console.log(JSON.stringify(longestCommonPrefix(["dog", "racecar", "car"])));
