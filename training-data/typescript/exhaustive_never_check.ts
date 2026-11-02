type Shape = { k: "sq"; s: number } | { k: "ci"; r: number };
function area(s: Shape): number {
  switch (s.k) {
    case "sq": return s.s ** 2;
    case "ci": return Math.PI * s.r ** 2;
    default: { const _x: never = s; return _x; }
  }
}
console.log(area({ k: "sq", s: 3 }));
