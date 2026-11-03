function* triangular(limit: number): Generator<number> {
  let sum = 0;
  for (let n = 1; n <= limit; n++) yield (sum += n);
}

console.log([...triangular(10)]);
