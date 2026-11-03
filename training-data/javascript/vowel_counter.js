function countVowels(s) {
  const result = { a: 0, e: 0, i: 0, o: 0, u: 0 };
  for (const ch of s.toLowerCase()) if (ch in result) result[ch]++;
  return result;
}

console.log(countVowels("Education is beautiful"));
