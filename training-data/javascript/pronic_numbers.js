const pronic = (count) => Array.from({ length: count }, (_, n) => n * (n + 1));

const isPronic = (x) => {
  const n = Math.floor(Math.sqrt(x));
  return n * (n + 1) === x;
};

console.log(pronic(10)); // [0, 2, 6, 12, 20, 30, 42, 56, 72, 90]
console.log(isPronic(56), isPronic(57)); // true false
