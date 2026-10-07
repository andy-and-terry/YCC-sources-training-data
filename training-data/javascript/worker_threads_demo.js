// worker_threads: one file acts as both main thread and worker, sharing
// memory through a SharedArrayBuffer and Atomics.
const { Worker, isMainThread, parentPort, workerData } = require('node:worker_threads');

if (isMainThread) {
  const shared = new SharedArrayBuffer(4);
  const counter = new Int32Array(shared);
  const workers = 4;
  let done = 0;
  for (let i = 0; i < workers; i++) {
    const w = new Worker(__filename, { workerData: { shared, n: 1000 } });
    w.on('message', (m) => console.log('worker finished', m.id !== undefined));
    w.on('exit', () => {
      if (++done === workers) console.log('total', Atomics.load(counter, 0));
    });
  }
} else {
  const counter = new Int32Array(workerData.shared);
  for (let i = 0; i < workerData.n; i++) Atomics.add(counter, 0, 1);
  parentPort.postMessage({ id: 1 });
}
