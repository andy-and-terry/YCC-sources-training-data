function minWindow(s, t) {
  const need = new Map();
  for (const c of t) need.set(c, (need.get(c) || 0) + 1);
  let missing = t.length, left = 0, bestL = 0, bestR = Infinity;
  for (let right = 0; right < s.length; right++) {
    const c = s[right];
    if ((need.get(c) || 0) > 0) missing--;
    need.set(c, (need.get(c) || 0) - 1);
    if (missing === 0) {
      while (need.get(s[left]) < 0) {
        need.set(s[left], need.get(s[left]) + 1);
        left++;
      }
      if (right + 1 - left < bestR - bestL) { bestL = left; bestR = right + 1; }
      need.set(s[left], need.get(s[left]) + 1);
      missing++;
      left++;
    }
  }
  return bestR === Infinity ? "" : s.slice(bestL, bestR);
}

console.log(minWindow("ADOBECODEBANC", "ABC"), JSON.stringify(minWindow("a", "aa")));
module.exports = { minWindow };
