// Pronic numbers n(n+1)
const term = (n) => n * (n + 1);

console.log(Array.from({ length: 10 }, (_, n) => term(n)).join(" "));
