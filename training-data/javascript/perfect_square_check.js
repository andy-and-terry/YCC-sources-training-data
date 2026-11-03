const isPerfectSquare = (n) => n >= 0 && Number.isInteger(Math.sqrt(n));

console.log(Array.from({ length: 30 }, (_, i) => i).filter(isPerfectSquare));
