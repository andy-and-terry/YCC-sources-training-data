interface Renderer {
  renderCircle(radius: number): string;
  renderSquare(side: number): string;
}

class VectorRenderer implements Renderer {
  renderCircle(radius: number): string {
    return `Drawing a vector circle of radius ${radius}`;
  }
  renderSquare(side: number): string {
    return `Drawing a vector square of side ${side}`;
  }
}

class RasterRenderer implements Renderer {
  renderCircle(radius: number): string {
    return `Drawing pixels for a circle of radius ${radius}`;
  }
  renderSquare(side: number): string {
    return `Drawing pixels for a square of side ${side}`;
  }
}

abstract class Shape {
  protected constructor(protected renderer: Renderer) {}
  abstract draw(): string;
}

class Circle extends Shape {
  constructor(renderer: Renderer, private radius: number) {
    super(renderer);
  }
  draw(): string {
    return this.renderer.renderCircle(this.radius);
  }
}

class Square extends Shape {
  constructor(renderer: Renderer, private side: number) {
    super(renderer);
  }
  draw(): string {
    return this.renderer.renderSquare(this.side);
  }
}

const shapes: Shape[] = [
  new Circle(new VectorRenderer(), 5),
  new Circle(new RasterRenderer(), 5),
  new Square(new VectorRenderer(), 3),
];

for (const shape of shapes) {
  console.log(shape.draw());
}
