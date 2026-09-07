function zArray(s) {
  const n = s.length;
  const z = new Array(n).fill(0);
  let l = 0;
  let r = 0;
  for (let i = 1; i < n; i++) {
    if (i < r) {
      z[i] = Math.min(r - i, z[i - l]);
    }
    while (i + z[i] < n && s[z[i]] === s[i + z[i]]) {
      z[i]++;
    }
    if (i + z[i] > r) {
      l = i;
      r = i + z[i];
    }
  }
  return z;
}

function zSearch(text, pattern) {
  const combined = `${pattern}$${text}`;
  const z = zArray(combined);
  const matches = [];
  for (let i = pattern.length + 1; i < combined.length; i++) {
    if (z[i] === pattern.length) matches.push(i - pattern.length - 1);
  }
  return matches;
}

console.log(zSearch('abxabcabcaby', 'abc'));
module.exports = { zArray, zSearch };
