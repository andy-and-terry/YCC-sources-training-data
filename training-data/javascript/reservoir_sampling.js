// Simple seeded PRNG (mulberry32) so the output is reproducible
function mulberry32(seed) {
  return () => {
    seed = (seed + 0x6d2b79f5) | 0;
    let t = Math.imul(seed ^ (seed >>> 15), 1 | seed);
    t = (t + Math.imul(t ^ (t >>> 7), 61 | t)) ^ t;
    return ((t ^ (t >>> 14)) >>> 0) / 4294967296;
  };
}

// Choose k items uniformly from an iterable of unknown length in one pass.
function reservoir(iterable, k, rand) {
  const res = [];
  let n = 0;
  for (const x of iterable) {
    if (n < k) res.push(x);
    else {
      const j = Math.floor(rand() * (n + 1));
      if (j < k) res[j] = x;
    }
    n++;
  }
  return res;
}

function* naturals(limit) {
  for (let i = 1; i <= limit; i++) yield i;
}

const picked = reservoir(naturals(1000), 5, mulberry32(7));
console.log(picked.length, picked.every((v) => v >= 1 && v <= 1000));
