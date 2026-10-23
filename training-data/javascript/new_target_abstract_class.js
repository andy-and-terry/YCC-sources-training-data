class Shape {
  constructor(name) {
    if (new.target === Shape) {
      throw new TypeError('Shape is abstract and cannot be instantiated directly');
    }
    this.name = name;
  }
  area() {
    throw new Error(`${this.constructor.name} must implement area()`);
  }
}

class Square extends Shape {
  constructor(side) {
    super('square');
    this.side = side;
  }
  area() {
    return this.side ** 2;
  }
}

class Broken extends Shape {
  constructor() {
    super('broken');
  }
}

try {
  new Shape('x');
} catch (e) {
  console.log(e.message);
}

console.log(new Square(3).area());

try {
  new Broken().area();
} catch (e) {
  console.log(e.message);
}

function Plain() {
  return new.target === undefined ? 'called without new' : 'called with new';
}
console.log(Plain());
console.log(new Plain() instanceof Plain);
