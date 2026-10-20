class Point {
  constructor(public readonly x: number, public readonly y: number, private tag = "p") {}
  toString() { return `${this.tag}(${this.x},${this.y})`; }
}
console.log(String(new Point(1, 2)));
