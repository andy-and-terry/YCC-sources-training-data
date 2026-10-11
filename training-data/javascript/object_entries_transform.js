const prices = { apple: 1.2, banana: 0.5, cherry: 3 };

const doubled = Object.fromEntries(Object.entries(prices).map(([k, v]) => [k, v * 2]));
console.log(doubled);

const expensive = Object.fromEntries(Object.entries(prices).filter(([, v]) => v > 1));
console.log(expensive);

const inverted = Object.fromEntries(Object.entries({ a: "x", b: "y" }).map(([k, v]) => [v, k]));
console.log(inverted);

const sortedByValue = Object.entries(prices).sort(([, a], [, b]) => b - a).map(([k]) => k);
console.log(sortedByValue);

const params = new URLSearchParams({ q: "js", page: 2 });
console.log(Object.fromEntries(params));
