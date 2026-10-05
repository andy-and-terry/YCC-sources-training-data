const compose = (...fns) => (x) => fns.reduceRight((acc, f) => f(acc), x);
const pipe = (...fns) => (x) => fns.reduce((acc, f) => f(acc), x);

const add = (a) => (b) => a + b;
const multiply = (a) => (b) => a * b;

const addThenDouble = pipe(add(3), multiply(2));
const doubleThenAdd = compose(add(3), multiply(2));

console.log(addThenDouble(5));
console.log(doubleThenAdd(5));

const words = pipe(
  (s) => s.trim(),
  (s) => s.split(/\s+/),
  (ws) => ws.map((w) => w[0].toUpperCase() + w.slice(1)),
  (ws) => ws.join(" ")
);
console.log(words("  hello functional   world "));
