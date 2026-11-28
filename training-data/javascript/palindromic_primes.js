const isPrime = (n) => {
  if (n < 2) return false;
  for (let i = 2; i * i <= n; i++) if (n % i === 0) return false;
  return true;
};
const isPalindrome = (n) => {
  const s = String(n);
  return s === [...s].reverse().join("");
};

const result = [];
for (let n = 0; n < 200; n++) if (isPalindrome(n) && isPrime(n)) result.push(n);
console.log(result); // [2, 3, 5, 7, 11, 101, 131, 151, 181, 191]
