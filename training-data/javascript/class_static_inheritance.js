class Shape {
  static count = 0;
  static create(...args) {
    Shape.count++;
    return new this(...args);
  }

  area() {
    return 0;
  }

  describe() {
    return `${this.constructor.name} with area ${this.area().toFixed(2)}`;
  }
}

class Circle extends Shape {
  constructor(r) {
    super();
    this.r = r;
  }
  area() {
    return Math.PI * this.r ** 2;
  }
}

class Square extends Shape {
  constructor(s) {
    super();
    this.s = s;
  }
  area() {
    return this.s ** 2;
  }
}

console.log(Circle.create(1).describe());
console.log(Square.create(3).describe());
console.log(Shape.count, Circle.count, Object.getPrototypeOf(Circle) === Shape);
