// Repunits: numbers made only of the digit 1.
function* repunits(count: number): Generator<number> {
  let r = 0;
  for (let i = 0; i < count; i++) {
    r = r * 10 + 1;
    yield r;
  }
}

console.log([...repunits(5)]);
