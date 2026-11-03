function* triangular() {
  let sum = 0;
  for (let n = 1; ; n++) yield (sum += n);
}

const first = [];
for (const t of triangular()) {
  if (first.length === 10) break;
  first.push(t);
}
console.log(first);
