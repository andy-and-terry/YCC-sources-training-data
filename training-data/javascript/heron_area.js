function heron(a, b, c) {
  if (a + b <= c || a + c <= b || b + c <= a) throw new RangeError("not a triangle");
  const s = (a + b + c) / 2;
  return Math.sqrt(s * (s - a) * (s - b) * (s - c));
}

console.log(heron(3, 4, 5)); // 6
try { heron(1, 2, 10); } catch (e) { console.log(e.name, e.message); }
