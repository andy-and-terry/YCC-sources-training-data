console.log('1: script start');

// Note: from the main module, setTimeout 0 vs setImmediate order is not guaranteed.
setTimeout(() => console.log('8: setTimeout 0'), 0);

setImmediate(() => console.log('9: setImmediate'));

process.nextTick(() => console.log('4: nextTick'));

Promise.resolve()
  .then(() => {
    console.log('5: promise 1');
    queueMicrotask(() => console.log('7: nested microtask'));
  })
  .then(() => console.log('6: promise 2'));

(async () => {
  console.log('2: async fn runs synchronously until first await');
  await null;
  console.log('5b: after await');
})();

console.log('3: script end');
