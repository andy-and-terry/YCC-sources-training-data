function bwt(s) {
  const rots = [...s].map((_, i) => s.slice(i) + s.slice(0, i)).sort();
  return rots.map((r) => r.at(-1)).join("");
}
console.log(bwt("banana$"));
