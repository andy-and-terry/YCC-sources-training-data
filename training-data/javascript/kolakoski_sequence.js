function kolakoski(count) {
  const seq = [1, 2, 2];
  for (let i = 2; seq.length < count; i++) {
    const value = 3 - seq[seq.length - 1];
    for (let k = 0; k < seq[i]; k++) seq.push(value);
  }
  return seq.slice(0, count);
}

console.log(kolakoski(20).join(" "));
