const isPerfectSquare = (n: number): boolean => n >= 0 && Number.isInteger(Math.sqrt(n));

console.log([0, 1, 2, 4, 15, 16, 25].map(isPerfectSquare));
