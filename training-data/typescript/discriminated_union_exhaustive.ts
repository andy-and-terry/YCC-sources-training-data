type Shape =
  | { kind: "circle"; radius: number }
  | { kind: "square"; side: number }
  | { kind: "triangle"; base: number; height: number };

function assertNever(x: never): never {
  throw new Error(`unexpected: ${JSON.stringify(x)}`);
}

function area(s: Shape): number {
  switch (s.kind) {
    case "circle":
      return Math.PI * s.radius ** 2;
    case "square":
      return s.side ** 2;
    case "triangle":
      return (s.base * s.height) / 2;
    default:
      return assertNever(s);
  }
}

console.log(area({ kind: "square", side: 3 }));
