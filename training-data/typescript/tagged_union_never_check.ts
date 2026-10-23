type Shape =
  | { kind: "circle"; r: number }
  | { kind: "rect"; w: number; h: number };

function assertNever(x: never): never {
  throw new Error("unexpected: " + JSON.stringify(x));
}

function area(s: Shape): number {
  switch (s.kind) {
    case "circle":
      return Math.PI * s.r ** 2;
    case "rect":
      return s.w * s.h;
    default:
      return assertNever(s);
  }
}

console.log(area({ kind: "circle", r: 1 }).toFixed(2));
console.log(area({ kind: "rect", w: 2, h: 3 }));
