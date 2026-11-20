// Wilson's theorem: n is prime iff (n-1)! mod n == n-1.
function wilsonIsPrime(n) {
  if (n < 2) return false;
  let fact = 1;
  for (let i = 2; i < n; i++) fact = (fact * i) % n;
  return fact === n - 1;
}
console.log([...Array(18).keys()].map((i) => i + 2).filter(wilsonIsPrime));
