// Functional idioms: manual currying and left-to-right function
// composition (pipe), built from plain closures.
function curry(fn) {
  return function curried(...args) {
    if (args.length >= fn.length) return fn.apply(this, args);
    return (...more) => curried.apply(this, args.concat(more));
  };
}

function pipe(...fns) {
  return (input) => fns.reduce((acc, fn) => fn(acc), input);
}

function compose(...fns) {
  return (input) => fns.reduceRight((acc, fn) => fn(acc), input);
}

const add3 = curry((a, b, c) => a + b + c);
console.log(add3(1)(2)(3));
console.log(add3(1, 2)(3));
console.log(add3(1, 2, 3));

const double = (x) => x * 2;
const increment = (x) => x + 1;
const square = (x) => x * x;

const pipeline = pipe(double, increment, square);
const pipelineReversed = compose(square, increment, double);
console.log(pipeline(3));
console.log(pipelineReversed(3));

module.exports = { curry, pipe, compose };
