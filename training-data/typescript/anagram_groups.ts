function groupAnagrams(words: string[]): string[][] {
  const groups = new Map<string, string[]>();
  for (const word of words) {
    const key = [...word].sort().join('');
    if (!groups.has(key)) groups.set(key, []);
    groups.get(key)!.push(word);
  }
  return [...groups.values()];
}

console.log(groupAnagrams(['eat', 'tea', 'tan', 'ate', 'nat', 'bat']));
