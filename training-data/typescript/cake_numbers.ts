// Cake numbers: max pieces from n plane cuts of a cube, (n^3 + 5n + 6) / 6.
const cake = (n: number): number => (n ** 3 + 5 * n + 6) / 6;
console.log(Array.from({ length: 10 }, (_, n) => cake(n)).join(" "));
