// Thue-Morse: t(n) is the parity of the number of 1 bits in n
const bits = (n) => n.toString(2).split("1").length - 1;
let out = "";
for (let n = 0; n < 32; n++) out += bits(n) % 2;
console.log(out);
