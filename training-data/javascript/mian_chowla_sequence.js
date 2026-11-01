// Greedy sequence whose pairwise sums (a+b with a <= b) are all distinct.
function mianChowla(count) {
  const seq = [];
  const sums = new Set();
  for (let cand = 1; seq.length < count; cand++) {
    const fresh = [...seq, cand].map((x) => x + cand);
    if (new Set(fresh).size === fresh.length && fresh.every((s) => !sums.has(s))) {
      seq.push(cand);
      fresh.forEach((s) => sums.add(s));
    }
  }
  return seq;
}
console.log(mianChowla(8).join(" "));
