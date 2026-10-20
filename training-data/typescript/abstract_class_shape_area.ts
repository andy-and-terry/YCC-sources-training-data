abstract class Shape {
  abstract area(): number;
  describe() { return `${this.constructor.name} area=${this.area().toFixed(2)}`; }
}
class Rect extends Shape { constructor(private w: number, private h: number) { super(); } area() { return this.w * this.h; } }
console.log(new Rect(2, 3).describe());
