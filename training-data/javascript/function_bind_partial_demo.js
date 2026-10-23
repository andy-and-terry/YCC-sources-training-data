// Function.prototype.bind fixes `this` and pre-fills leading arguments.

const counter = {
  count: 0,
  step: 2,
  inc() {
    this.count += this.step;
    return this.count;
  },
};

const detached = counter.inc;
try {
  detached();
} catch (e) {
  console.log("detached call fails:", e instanceof TypeError || e instanceof Error);
}

const bound = counter.inc.bind(counter);
console.log(bound(), bound());

// Partial application
function volume(w, h, d) {
  return w * h * d;
}
const tall = volume.bind(null, 2, 10);
console.log(tall(3), tall(5));

// Bound functions remember their name and arity
console.log(tall.name, tall.length);

// Bound constructors ignore the bound `this`
function Point(x, y) {
  this.x = x;
  this.y = y;
}
const AtOrigin = Point.bind(null, 0);
const p = new AtOrigin(7);
console.log(p, p instanceof Point);
