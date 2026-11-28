const popcount = (n: number): number => n.toString(2).split("1").length - 1;
const gould = (n: number): number => 2 ** popcount(n);

console.log(Array.from({ length: 16 }, (_, n) => gould(n)).join(" "));
