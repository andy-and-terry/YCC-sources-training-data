function* readNumbers(items: Iterable<number>): Generator<number> {
  yield* items;
}

function* filterEven(numbers: Iterable<number>): Generator<number> {
  for (const n of numbers) if (n % 2 === 0) yield n;
}

function* square(numbers: Iterable<number>): Generator<number> {
  for (const n of numbers) yield n * n;
}

function pipeline(items: Iterable<number>): Generator<number> {
  return square(filterEven(readNumbers(items)));
}

console.log([...pipeline(Array.from({ length: 10 }, (_, i) => i))]);
