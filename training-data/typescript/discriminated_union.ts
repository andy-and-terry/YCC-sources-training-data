type Shape =
  | { kind: 'circle'; radius: number }
  | { kind: 'rectangle'; width: number; height: number }
  | { kind: 'triangle'; base: number; height: number };

function area(shape: Shape): number {
  switch (shape.kind) {
    case 'circle':
      return Math.PI * shape.radius ** 2;
    case 'rectangle':
      return shape.width * shape.height;
    case 'triangle':
      return 0.5 * shape.base * shape.height;
    default: {
      const exhaustive: never = shape;
      throw new Error(`unhandled shape: ${exhaustive}`);
    }
  }
}

const shapes: Shape[] = [
  { kind: 'circle', radius: 2 },
  { kind: 'rectangle', width: 3, height: 4 },
  { kind: 'triangle', base: 5, height: 6 },
];
console.log(shapes.map(area));
