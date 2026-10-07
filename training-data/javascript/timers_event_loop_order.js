console.log('1 sync start');

setTimeout(() => console.log('6 timeout 0'), 0);
setImmediate(() => console.log('7 immediate'));

Promise.resolve().then(() => console.log('4 promise microtask'));
queueMicrotask(() => console.log('5 queueMicrotask'));
process.nextTick(() => console.log('3 nextTick'));

(async () => {
  console.log('2 async fn body runs synchronously');
  await null;
  console.log('4b after await');
})();

console.log('2b sync end');
