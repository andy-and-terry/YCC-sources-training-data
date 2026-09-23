// ES2024 Iterator helpers: lazy chaining directly on any iterator,
// without first materializing an intermediate array.
function* naturals() {
  let n = 1;
  while (true) yield n++;
}

const firstFiveSquaresOfEvens = naturals()
  .filter((n) => n % 2 === 0)
  .map((n) => n * n)
  .take(5)
  .toArray();
console.log(firstFiveSquaresOfEvens);

const total = [1, 2, 3, 4, 5]
  .values()
  .map((n) => n * 2)
  .reduce((sum, n) => sum + n, 0);
console.log(total);

console.log([10, 20, 30].values().some((n) => n > 25));
console.log([10, 20, 30].values().every((n) => n > 5));

module.exports = { naturals };
