const Serializable = (Base) => class extends Base { serialize() { return JSON.stringify(this); } };
const Comparable = (Base) => class extends Base { equals(o) { return this.serialize() === o.serialize(); } };
class Point { constructor(x, y) { this.x = x; this.y = y; } }
class SmartPoint extends Comparable(Serializable(Point)) {}
console.log(new SmartPoint(1, 2).equals(new SmartPoint(1, 2)));
