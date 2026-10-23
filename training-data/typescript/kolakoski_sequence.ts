function kolakoski(count: number): number[] {
  const seq: number[] = [1, 2, 2];
  let i = 2;
  while (seq.length < count) {
    const value = seq[seq.length - 1] === 2 ? 1 : 2;
    for (let k = 0; k < seq[i]; k++) seq.push(value);
    i++;
  }
  return seq.slice(0, count);
}

console.log(kolakoski(20).join(" "));
