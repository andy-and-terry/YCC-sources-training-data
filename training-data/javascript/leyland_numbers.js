// Leyland numbers: x**y + y**x for x >= y >= 2.
const leyland = (x, y) => x ** y + y ** x;
const vals = [];
for (let x = 2; x <= 4; x++) for (let y = 2; y <= x; y++) vals.push(leyland(x, y));
console.log(vals.join(" "));
