// Evil numbers: even count of 1 bits.
const out: number[] = [];
for (let n = 0; n <= 20; n++) {
  if ((n.toString(2).split("1").length - 1) % 2 === 0) out.push(n);
}
console.log(out.join(" "));
