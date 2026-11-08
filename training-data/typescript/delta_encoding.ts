const encode = (xs: number[]): number[] => xs.map((x, i) => (i === 0 ? x : x - xs[i - 1]));
const decode = (ds: number[]): number[] => {
  let acc = 0;
  return ds.map((d) => (acc += d));
};

const d = encode([10, 12, 15, 15, 20]);
console.log(d, decode(d));
