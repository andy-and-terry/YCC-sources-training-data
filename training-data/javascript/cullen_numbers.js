// Cullen numbers: n * 2^n + 1
const out = [];
for (let n = 0; n < 10; n++) out.push(n * 2 ** n + 1);
console.log(out.join(" "));
