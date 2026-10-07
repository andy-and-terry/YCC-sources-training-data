// Execution order: synchronous code, process.nextTick, microtasks (promises,
// queueMicrotask), then timers and setImmediate.
console.log('1 sync start');

setTimeout(() => console.log('7 setTimeout 0'), 0);
setImmediate(() => console.log('8 setImmediate'));

Promise.resolve().then(() => console.log('4 promise then'));
queueMicrotask(() => console.log('5 queueMicrotask'));
process.nextTick(() => console.log('3 nextTick'));

(async () => {
  console.log('2 async fn body runs synchronously');
  await null;
  console.log('6 after await');
})();
