console.log("start");
setTimeout(() => console.log("timeout"), 0);
Promise.resolve().then(() => console.log("microtask"));
queueMicrotask(() => console.log("queueMicrotask"));
console.log("end");
