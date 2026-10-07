class Renderer {
  renderCircle(radius) {
    throw new Error('not implemented');
  }
}

class VectorRenderer extends Renderer {
  renderCircle(radius) {
    return `drawing a vector circle of radius ${radius}`;
  }
}

class RasterRenderer extends Renderer {
  renderCircle(radius) {
    return `drawing ${Math.round(Math.PI * radius * radius)} pixels for a circle`;
  }
}

class Shape {
  constructor(renderer) {
    this.renderer = renderer;
  }
}

class Circle extends Shape {
  constructor(renderer, radius) {
    super(renderer);
    this.radius = radius;
  }
  draw() {
    return this.renderer.renderCircle(this.radius);
  }
  resize(factor) {
    this.radius *= factor;
    return this;
  }
}

const vectorCircle = new Circle(new VectorRenderer(), 5);
const rasterCircle = new Circle(new RasterRenderer(), 5);

console.log(vectorCircle.draw());
console.log(rasterCircle.resize(2).draw());
module.exports = { Renderer, VectorRenderer, RasterRenderer, Shape, Circle };
