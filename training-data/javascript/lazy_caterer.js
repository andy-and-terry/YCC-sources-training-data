// Lazy caterer sequence: max pieces from n cuts
const term = (n) => ((n * (n + 1)) / 2) + 1;

console.log(Array.from({ length: 10 }, (_, n) => term(n)).join(" "));
