class Point {
  constructor(x, y) {
    this.x = x;
    this.y = y;
  }
  norm() {
    return Math.hypot(this.x, this.y);
  }
}

const p = Reflect.construct(Point, [3, 4]);
console.log(p instanceof Point, Reflect.apply(p.norm, p, []));

console.log(Reflect.has(p, "x"), Reflect.has(p, "norm"), Reflect.ownKeys(p));
console.log(Reflect.getPrototypeOf(p) === Point.prototype);

Reflect.defineProperty(p, "id", { value: 99, writable: false, enumerable: false });
console.log(p.id, Object.keys(p), Reflect.set(p, "id", 1), p.id);

console.log(Reflect.deleteProperty(p, "x"), p.x);

const frozen = Object.freeze({ a: 1 });
console.log(Reflect.set(frozen, "a", 2), Reflect.isExtensible(frozen));

const target = { name: "t" };
const logged = new Proxy(target, {
  get(t, key, receiver) {
    console.log("get", String(key));
    return Reflect.get(t, key, receiver);
  },
});
console.log(logged.name);
