class Circle {
  constructor(radius) {
    this.radius = radius;
  }
  area() {
    return Math.PI * this.radius ** 2;
  }
}

class Square {
  constructor(side) {
    this.side = side;
  }
  area() {
    return this.side ** 2;
  }
}

function shapeFactory(kind, options) {
  const shapes = { circle: Circle, square: Square };
  const Ctor = shapes[kind];
  if (!Ctor) throw new Error(`unknown shape: ${kind}`);
  return kind === 'circle' ? new Ctor(options.radius) : new Ctor(options.side);
}

console.log(shapeFactory('circle', { radius: 2 }).area());
console.log(shapeFactory('square', { side: 3 }).area());
module.exports = { shapeFactory };
