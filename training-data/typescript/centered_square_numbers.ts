// Centered square numbers: n^2 + (n+1)^2.
console.log(Array.from({ length: 10 }, (_: unknown, n: number) => n * n + (n + 1) ** 2).join(" "));
