const ok = (v, ms) => new Promise(r => setTimeout(() => r(v), ms));
const fail = ms => new Promise((_, rej) => setTimeout(() => rej(new Error('x')), ms));

(async () => {
  console.log(await Promise.allSettled([ok(1, 5), fail(1)]));
  console.log(await Promise.race([ok('slow', 30), ok('fast', 5)]));
  console.log(await Promise.any([fail(1), ok('winner', 10)]));
})();
