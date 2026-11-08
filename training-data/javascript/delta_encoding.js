const encode = (xs) => xs.map((x, i) => (i ? x - xs[i - 1] : x));
const decode = (ds) => ds.reduce((acc, d) => [...acc, (acc.at(-1) ?? 0) + d], []);

const d = encode([10, 12, 15, 15, 20]);
console.log(d, decode(d));
