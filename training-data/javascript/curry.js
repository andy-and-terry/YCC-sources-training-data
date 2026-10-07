// curry() turns an n-ary function into a chain of unary calls; compose()
// wires functions together right-to-left. Both are common functional
// building blocks not tied to any one algorithm.
function curry(fn) {
  return function curried(...args) {
    if (args.length >= fn.length) return fn.apply(this, args);
    return (...more) => curried.apply(this, args.concat(more));
  };
}

function compose(...fns) {
  return (initial) => fns.reduceRight((acc, fn) => fn(acc), initial);
}

const add3 = curry((a, b, c) => a + b + c);

console.log(add3(1, 2, 3));
console.log(add3(1)(2)(3));
console.log(add3(1, 2)(3));

const double = (x) => x * 2;
const increment = (x) => x + 1;
const square = (x) => x * x;

const pipeline = compose(square, increment, double);
console.log(pipeline(3)); // double(3)=6, increment(6)=7, square(7)=49

module.exports = { curry, compose };
