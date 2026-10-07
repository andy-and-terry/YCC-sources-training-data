function compress(s) {
  if (!s) return s;
  let out = "";
  let count = 1;
  for (let i = 1; i <= s.length; i++) {
    if (s[i] === s[i - 1]) count++;
    else {
      out += s[i - 1] + count;
      count = 1;
    }
  }
  return out.length < s.length ? out : s;
}

for (const w of ["aabcccccaaa", "abc", "zzzzzzzzzz"]) console.log(w, "->", compress(w));
module.exports = { compress };
