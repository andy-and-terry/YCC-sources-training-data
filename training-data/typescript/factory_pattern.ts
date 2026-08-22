interface Shape {
  area(): number;
}

class Circle implements Shape {
  constructor(private radius: number) {}
  area(): number {
    return Math.PI * this.radius ** 2;
  }
}

class Square implements Shape {
  constructor(private side: number) {}
  area(): number {
    return this.side ** 2;
  }
}

type ShapeKind = 'circle' | 'square';

function shapeFactory(kind: ShapeKind, options: { radius?: number; side?: number }): Shape {
  if (kind === 'circle') return new Circle(options.radius!);
  if (kind === 'square') return new Square(options.side!);
  throw new Error(`unknown shape: ${kind}`);
}

console.log(shapeFactory('circle', { radius: 2 }).area());
console.log(shapeFactory('square', { side: 3 }).area());
