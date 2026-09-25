function horspool(text, pattern) {
  const m = pattern.length, n = text.length;
  if (m === 0) return [0];
  const shift = new Map();
  for (let i = 0; i < m - 1; i++) shift.set(pattern[i], m - 1 - i);
  const matches = [];
  let i = 0;
  while (i <= n - m) {
    let j = m - 1;
    while (j >= 0 && text[i + j] === pattern[j]) j--;
    if (j < 0) matches.push(i);
    i += shift.get(text[i + m - 1]) ?? m;
  }
  return matches;
}

console.log(horspool("here is a simple example, an example indeed", "example"));
module.exports = { horspool };
