console.log("1 sync start");

setTimeout(() => console.log("5 setTimeout"), 0);

setImmediate(() => console.log("6 setImmediate"));

Promise.resolve().then(() => console.log("3 promise microtask"));

queueMicrotask(() => console.log("4 queueMicrotask"));

process.nextTick(() => console.log("2.5 nextTick"));

(async () => {
  console.log("2 async fn runs synchronously until first await");
  await null;
  console.log("4.5 after await");
})();

console.log("2.1 sync end");
