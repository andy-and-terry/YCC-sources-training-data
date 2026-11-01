type Shape = { kind: "sq"; s: number } | { kind: "ci"; r: number };

function assertNever(x: never): never {
  throw new Error(`unexpected ${JSON.stringify(x)}`);
}

function area(s: Shape): number {
  switch (s.kind) {
    case "sq": return s.s ** 2;
    case "ci": return Math.PI * s.r ** 2;
    default: return assertNever(s);
  }
}

console.log(area({ kind: "sq", s: 3 }));
