// Measuring elapsed time: performance.now() is monotonic and sub-millisecond,
// unlike Date.now(), which can jump if the system clock changes.
const { performance } = require("node:perf_hooks");

function busyWork(n) {
  let total = 0;
  for (let i = 0; i < n; i++) total += Math.sqrt(i);
  return total;
}

function measure(label, fn, runs = 5) {
  const samples = [];
  for (let i = 0; i < runs; i++) {
    const start = performance.now();
    fn();
    samples.push(performance.now() - start);
  }
  samples.sort((a, b) => a - b);
  const median = samples[Math.floor(samples.length / 2)];
  console.log(`${label}: median is positive = ${median > 0}, runs = ${samples.length}`);
}

measure("sqrt loop", () => busyWork(200000));

const t0 = process.hrtime.bigint();
busyWork(100000);
const elapsedNs = process.hrtime.bigint() - t0;
console.log("hrtime elapsed is bigint:", typeof elapsedNs === "bigint");
console.log("hrtime elapsed > 0:", elapsedNs > 0n);

performance.mark("start");
busyWork(50000);
performance.mark("end");
const m = performance.measure("work", "start", "end");
console.log("measure name:", m.name, "duration >= 0:", m.duration >= 0);
