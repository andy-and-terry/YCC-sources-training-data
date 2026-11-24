// Repunits: R_n = (10^n - 1) / 9 = 11...1.
const repunits: number[] = [];
for (let n = 1; n <= 8; n++) repunits.push((10 ** n - 1) / 9);
console.log(repunits.join(" "));
console.log(repunits.filter((r: number) => r % 3 === 0));
