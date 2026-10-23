function vanEck(count) {
  const seq = [0];
  const lastSeen = new Map();
  for (let i = 0; i < count - 1; i++) {
    const cur = seq[i];
    const next = lastSeen.has(cur) ? i - lastSeen.get(cur) : 0;
    lastSeen.set(cur, i);
    seq.push(next);
  }
  return seq;
}

console.log(vanEck(20).join(" "));
