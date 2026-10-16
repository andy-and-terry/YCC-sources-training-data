type Shape =
  | { kind: "circle"; radius: number }
  | { kind: "square"; side: number }
  | { kind: "triangle"; base: number; height: number };

type Round = Extract<Shape, { kind: "circle" }>;
type Angular = Exclude<Shape, { kind: "circle" }>;
type Kinds = Shape["kind"];
type NotTriangle = Exclude<Kinds, "triangle">;

const c: Round = { kind: "circle", radius: 2 };
const shapes: Angular[] = [
  { kind: "square", side: 3 },
  { kind: "triangle", base: 4, height: 5 },
];
const allowed: NotTriangle[] = ["circle", "square"];

function area(s: Shape): number {
  switch (s.kind) {
    case "circle":
      return Math.PI * s.radius ** 2;
    case "square":
      return s.side ** 2;
    case "triangle":
      return (s.base * s.height) / 2;
  }
}

console.log(area(c).toFixed(2), shapes.map(area), allowed);
