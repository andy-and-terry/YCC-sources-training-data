function createCounter(start = 0) {
  let count = start;
  return {
    increment: () => ++count,
    decrement: () => --count,
    reset: () => {
      count = start;
    },
    get value() {
      return count;
    },
  };
}

const a = createCounter();
const b = createCounter(100);
a.increment();
a.increment();
b.decrement();
console.log(a.value, b.value, a.count);
a.reset();
console.log(a.value);

const fns = [];
for (var i = 0; i < 3; i++) fns.push(() => i);
const fixed = [];
for (let j = 0; j < 3; j++) fixed.push(() => j);
console.log(fns.map((f) => f()), fixed.map((f) => f()));
