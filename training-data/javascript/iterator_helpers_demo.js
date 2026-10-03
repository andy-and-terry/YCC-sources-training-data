// A custom iterable, built the classic way with Symbol.iterator, works
// with plain for-of and the spread operator regardless of any newer
// iterator-helper methods a given runtime does or doesn't support.
function range(start, end, step = 1) {
  return {
    [Symbol.iterator]() {
      let current = start;
      return {
        next() {
          if (current >= end) return { value: undefined, done: true };
          const value = current;
          current += step;
          return { value, done: false };
        },
      };
    },
  };
}

console.log([...range(0, 10, 2)]);

for (const n of range(1, 6)) {
  console.log('range value:', n);
}

function take(iterable, count) {
  const result = [];
  for (const value of iterable) {
    if (result.length >= count) break;
    result.push(value);
  }
  return result;
}

console.log(take(range(0, 1000), 5));

module.exports = { range, take };
