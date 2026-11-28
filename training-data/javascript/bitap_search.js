function bitap(text, pat) {
  const masks = new Map();
  [...pat].forEach((c, i) => masks.set(c, (masks.get(c) ?? 0) | (1 << i)));
  const goal = 1 << (pat.length - 1);
  let state = 0;
  for (let i = 0; i < text.length; i++) {
    state = ((state << 1) | 1) & (masks.get(text[i]) ?? 0);
    if (state & goal) return i - pat.length + 1;
  }
  return -1;
}
console.log(bitap("the quick brown fox", "brown"));
