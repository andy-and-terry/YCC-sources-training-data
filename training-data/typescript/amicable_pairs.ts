// Amicable pairs: d(a) === b and d(b) === a with a !== b.
const d = (n: number): number => {
  let s = 0;
  for (let i = 1; i < n; i++) if (n % i === 0) s += i;
  return s;
};

const pairs: Array<[number, number]> = [];
for (let a = 2; a < 1500; a++) {
  const b = d(a);
  if (b > a && d(b) === a) pairs.push([a, b]);
}
console.log(pairs);
