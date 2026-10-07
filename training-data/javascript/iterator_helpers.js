// Iterator helpers (Node 22+): lazy map/filter/take/drop on any iterator.
function* naturals() {
  let n = 1;
  while (true) yield n++;
}

const result = naturals()
  .filter((n) => n % 3 === 0)
  .map((n) => n * n)
  .drop(1)
  .take(4)
  .toArray();
console.log(result);

console.log(naturals().take(5).reduce((a, b) => a + b, 0));
console.log(naturals().some((n) => n > 10));
console.log(naturals().take(3).every((n) => n < 4));
console.log(naturals().find((n) => n * n > 50));
naturals().take(2).forEach((n) => console.log('item', n));
console.log(Iterator.from([1, 2, 3]).flatMap((n) => [n, n * 10]).toArray());
