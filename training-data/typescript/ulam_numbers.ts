function ulam(count: number): number[] {
  const seq: number[] = [1, 2];
  for (let n = 3; seq.length < count; n++) {
    const ways = seq.filter((a) => a < n - a && seq.includes(n - a)).length;
    if (ways === 1) seq.push(n);
  }
  return seq;
}

console.log(ulam(15).join(" "));
