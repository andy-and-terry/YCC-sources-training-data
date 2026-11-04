function interleave(...parts) {
  const longest = Math.max(...parts.map((p) => p.length));
  let out = "";
  for (let i = 0; i < longest; i++) {
    for (const p of parts) if (i < p.length) out += p[i];
  }
  return out;
}

console.log(interleave("abc", "12345")); // a1b2c345
console.log(interleave("ab", "cd", "efg")); // acebdfg
