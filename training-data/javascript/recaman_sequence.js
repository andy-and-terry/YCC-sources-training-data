function recaman(count) {
  const seq = [0];
  const seen = new Set([0]);
  for (let n = 1; n < count; n++) {
    let next = seq[n - 1] - n;
    if (next < 0 || seen.has(next)) next = seq[n - 1] + n;
    seq.push(next);
    seen.add(next);
  }
  return seq;
}

console.log(recaman(20).join(" "));
