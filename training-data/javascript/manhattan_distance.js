const manhattan = (a, b) => a.reduce((s, x, i) => s + Math.abs(x - b[i]), 0);
console.log(manhattan([1, 2], [4, 6]));
console.log(manhattan([0, 0, 0], [1, -2, 3]));
