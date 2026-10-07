const KEYPAD: Record<string, string> = { 2: "abc", 3: "def", 4: "ghi", 5: "jkl", 6: "mno", 7: "pqrs", 8: "tuv", 9: "wxyz" };

export function* letterCombinations(digits: string): Generator<string> {
  if (!digits) return;
  const idx = new Array<number>(digits.length).fill(0);
  const letters = [...digits].map((d) => {
    const l = KEYPAD[d];
    if (!l) throw new RangeError(`digit ${d} has no letters`);
    return l;
  });
  for (;;) {
    yield idx.map((i, k) => letters[k][i]).join("");
    let k = idx.length - 1;
    while (k >= 0 && ++idx[k] === letters[k].length) idx[k--] = 0;
    if (k < 0) return;
  }
}

console.log([...letterCombinations("23")]);
console.log([...letterCombinations("7979")].length);
