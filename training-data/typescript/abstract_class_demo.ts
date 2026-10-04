abstract class Shape {
  constructor(public readonly name: string) {}

  abstract area(): number;

  describe(): string {
    return `${this.name} with area ${this.area().toFixed(2)}`;
  }
}

class Circle extends Shape {
  constructor(private radius: number) {
    super("Circle");
  }
  area(): number {
    return Math.PI * this.radius ** 2;
  }
}

class Rect extends Shape {
  constructor(private w: number, private h: number) {
    super("Rect");
  }
  area(): number {
    return this.w * this.h;
  }
}

const shapes: Shape[] = [new Circle(1.5), new Rect(2, 3)];
for (const s of shapes) console.log(s.describe());
