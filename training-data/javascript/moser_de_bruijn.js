// Moser-de Bruijn sequence: binary digits of n read in base 4.
const out = [];
for (let n = 0; n < 12; n++) out.push(parseInt(n.toString(2), 4));
console.log(out.join(" "));
