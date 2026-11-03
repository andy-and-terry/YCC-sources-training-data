const isPowerOfTwo = (n) => n > 0 && (n & (n - 1)) === 0;

console.log(Array.from({ length: 39 }, (_, i) => i + 1).filter(isPowerOfTwo));
