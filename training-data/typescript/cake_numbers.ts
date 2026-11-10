const cake = (n: number): number => (n ** 3 + 5 * n + 6) / 6;
console.log(Array.from({ length: 10 }, (_, n) => cake(n)).join(" ")); // 1 2 4 8 15 26 42 64 93 130
