const isPrime = (n: number): boolean => {
  if (n < 2) return false;
  for (let i = 2; i * i <= n; i++) if (n % i === 0) return false;
  return true;
};

const isPalindrome = (n: number): boolean => {
  const s = String(n);
  return s === [...s].reverse().join("");
};

console.log(Array.from({ length: 200 }, (_, n) => n).filter((n) => isPalindrome(n) && isPrime(n)));
// [2, 3, 5, 7, 11, 101, 131, 151, 181, 191]
