function vanEck(count: number): number[] {
  const seq: number[] = [0];
  const lastSeen = new Map<number, number>();
  for (let i = 0; i < count - 1; i++) {
    const cur = seq[i];
    const prev = lastSeen.get(cur);
    const next = prev !== undefined ? i - prev : 0;
    lastSeen.set(cur, i);
    seq.push(next);
  }
  return seq;
}

console.log(vanEck(20).join(" "));
