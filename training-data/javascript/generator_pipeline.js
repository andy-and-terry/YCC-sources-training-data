function* readNumbers(items) {
  yield* items;
}

function* filterEven(numbers) {
  for (const n of numbers) if (n % 2 === 0) yield n;
}

function* square(numbers) {
  for (const n of numbers) yield n * n;
}

function pipeline(items) {
  return square(filterEven(readNumbers(items)));
}

console.log([...pipeline(Array.from({ length: 10 }, (_, i) => i))]);
module.exports = { pipeline };
