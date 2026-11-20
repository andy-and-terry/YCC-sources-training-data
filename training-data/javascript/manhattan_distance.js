// Manhattan (L1) distance in any dimension.
const manhattan = (a, b) => a.reduce((s, x, i) => s + Math.abs(x - b[i]), 0);
console.log(manhattan([1, 2], [4, 6]));
