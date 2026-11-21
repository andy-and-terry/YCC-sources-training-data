// Amicable pairs below 1500 via sums of proper divisors.
const s = (n) => {
  let t = 0;
  for (let d = 1; d < n; d++) if (n % d === 0) t += d;
  return t;
};
for (let a = 2; a < 1500; a++) {
  const b = s(a);
  if (b > a && s(b) === a) console.log(a, b);
}
