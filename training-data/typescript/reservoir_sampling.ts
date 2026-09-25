function reservoirSample<T>(stream: Iterable<T>, k: number, rng: () => number = Math.random): T[] {
  const reservoir: T[] = [];
  let index = 0;
  for (const item of stream) {
    if (index < k) {
      reservoir.push(item);
    } else {
      const j = Math.floor(rng() * (index + 1));
      if (j < k) reservoir[j] = item;
    }
    index++;
  }
  return reservoir;
}

function* naturals(limit: number): Generator<number> {
  for (let i = 1; i <= limit; i++) yield i;
}

let seed = 42;
function seededRandom(): number {
  seed = (seed * 1103515245 + 12345) % 2147483648;
  return seed / 2147483648;
}

const sample = reservoirSample(naturals(100), 5, seededRandom);
console.log(sample.length, sample.every((n) => n >= 1 && n <= 100));
