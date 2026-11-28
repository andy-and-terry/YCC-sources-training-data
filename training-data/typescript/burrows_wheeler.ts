function bwt(s: string): string {
  const rots = Array.from(s, (_, i) => s.slice(i) + s.slice(0, i)).sort();
  return rots.map((r) => r[r.length - 1]).join("");
}
console.log(bwt("banana$"));
