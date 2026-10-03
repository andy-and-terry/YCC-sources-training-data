function memoize<Arg extends string | number, Return>(
  fn: (arg: Arg) => Return,
): (arg: Arg) => Return {
  const cache = new Map<Arg, Return>();
  return (arg: Arg): Return => {
    if (cache.has(arg)) {
      return cache.get(arg) as Return;
    }
    const result = fn(arg);
    cache.set(arg, result);
    return result;
  };
}

let calls = 0;
const slowSquare = (n: number): number => {
  calls += 1;
  return n * n;
};

const fastSquare = memoize(slowSquare);
console.log(fastSquare(5));
console.log(fastSquare(5));
console.log(fastSquare(6));
console.log(`underlying calls: ${calls}`);
