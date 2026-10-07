const KEYPAD = { 2: "abc", 3: "def", 4: "ghi", 5: "jkl", 6: "mno", 7: "pqrs", 8: "tuv", 9: "wxyz" };

function letterCombinations(digits) {
  if (!digits) return [];
  return [...digits].reduce(
    (acc, d) => acc.flatMap((prefix) => [...KEYPAD[d]].map((ch) => prefix + ch)),
    [""],
  );
}

console.log(letterCombinations("23"));
console.log(letterCombinations("7979").length);
module.exports = { letterCombinations };
