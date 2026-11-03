type VowelCounts = Record<"a" | "e" | "i" | "o" | "u", number>;

function countVowels(s: string): VowelCounts {
  const result: VowelCounts = { a: 0, e: 0, i: 0, o: 0, u: 0 };
  for (const ch of s.toLowerCase()) {
    if (ch in result) result[ch as keyof VowelCounts]++;
  }
  return result;
}

console.log(countVowels("Education is beautiful"));
