// Square of the sum minus sum of squares for 1..10 (expect 2640)
const xs: number[] = Array.from({ length: 10 }, (_, i) => i + 1);
const sum = xs.reduce((a, b) => a + b, 0);
const squares = xs.reduce((a, x) => a + x * x, 0);
console.log(sum * sum - squares);
