function binaryGap(n) {
  const gaps = n.toString(2).replace(/0+$/, "").split("1").map((s) => s.length);
  return Math.max(0, ...gaps);
}

[9, 529, 20, 15, 1041].forEach((n) => console.log(n, n.toString(2), binaryGap(n)));
