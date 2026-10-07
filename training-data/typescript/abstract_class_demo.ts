abstract class Shape {
  constructor(public readonly name: string) {}
  abstract area(): number;
  abstract perimeter(): number;

  describe(): string {
    return `${this.name}: area=${this.area().toFixed(2)}, perimeter=${this.perimeter().toFixed(2)}`;
  }
}

class Circle extends Shape {
  constructor(private r: number) {
    super("Circle");
  }
  area(): number {
    return Math.PI * this.r ** 2;
  }
  perimeter(): number {
    return 2 * Math.PI * this.r;
  }
}

class Rect extends Shape {
  constructor(private w: number, private h: number) {
    super("Rect");
  }
  area(): number {
    return this.w * this.h;
  }
  perimeter(): number {
    return 2 * (this.w + this.h);
  }
}

const shapes: Shape[] = [new Circle(1.5), new Rect(2, 3)];
shapes.forEach((s) => console.log(s.describe()));
