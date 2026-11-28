function stern(count) {
  const seq = [0, 1];
  for (let i = 2; i < count; i++) {
    const h = i >> 1;
    seq.push(i % 2 === 0 ? seq[h] : seq[h] + seq[h + 1]);
  }
  return seq.slice(0, count);
}

console.log(stern(15)); // [0,1,1,2,1,3,2,3,1,4,3,5,2,5,3]
