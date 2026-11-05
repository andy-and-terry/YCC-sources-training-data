function* inner() { yield 1; yield 2; return 'done'; }
function* outer() {
  const r = yield* inner();
  yield r;
  yield* [10, 20];
}
console.log([...outer()]);
