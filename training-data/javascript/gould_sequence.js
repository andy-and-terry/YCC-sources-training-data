const popcount = (n) => n.toString(2).split("1").length - 1;
const gould = (n) => 2 ** popcount(n); // odd entries in Pascal row n

console.log(Array.from({ length: 16 }, (_, n) => gould(n)).join(" "));
