interface Renderer {
  renderCircle(radius: number): string;
}

class VectorRenderer implements Renderer {
  renderCircle(radius: number): string {
    return `drawing a vector circle of radius ${radius}`;
  }
}

class RasterRenderer implements Renderer {
  renderCircle(radius: number): string {
    return `drawing pixels for a circle of radius ${radius}`;
  }
}

abstract class Shape {
  protected constructor(protected renderer: Renderer) {}
  abstract draw(): string;
}

class Circle extends Shape {
  constructor(
    renderer: Renderer,
    private radius: number,
  ) {
    super(renderer);
  }

  draw(): string {
    return this.renderer.renderCircle(this.radius);
  }

  resize(factor: number): void {
    this.radius *= factor;
  }
}

const vectorCircle = new Circle(new VectorRenderer(), 5);
const rasterCircle = new Circle(new RasterRenderer(), 5);

console.log(vectorCircle.draw());
console.log(rasterCircle.draw());
