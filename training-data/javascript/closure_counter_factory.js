function makeCounter(step = 1) {
  let count = 0;
  return {
    next: () => (count += step),
    reset: () => {
      count = 0;
    },
  };
}

const a = makeCounter();
const b = makeCounter(5);
a.next();
a.next();
console.log(a.next(), b.next(), b.next());
