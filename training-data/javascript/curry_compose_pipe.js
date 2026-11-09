const curry = fn => function c(...a) { return a.length >= fn.length ? fn(...a) : (...b) => c(...a, ...b); };
const pipe = (...fs) => x => fs.reduce((v, f) => f(v), x);
const add = curry((a, b) => a + b);
console.log(pipe(add(1), x => x * 2)(4));
