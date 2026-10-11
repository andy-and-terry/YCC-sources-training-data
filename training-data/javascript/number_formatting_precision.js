console.log(0.1 + 0.2);
console.log(0.1 + 0.2 === 0.3, Math.abs(0.1 + 0.2 - 0.3) < Number.EPSILON);

const round = (n, places) => Math.round((n + Number.EPSILON) * 10 ** places) / 10 ** places;
console.log(round(1.005, 2), (1.005).toFixed(2));

console.log((1234.5678).toFixed(1), (0.000123).toPrecision(2), (255).toString(2));
console.log((1e21).toLocaleString("en-US"), Number.MAX_SAFE_INTEGER);
console.log(Number("12px"), parseInt("12px", 10), parseFloat("3.5e2x"));
console.log(Number.isInteger(5.0), Number.isSafeInteger(2 ** 53));
