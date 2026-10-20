function bell(n) {
  let row = [1];
  for (let i = 0; i < n; i++) {
    const next = [row[row.length - 1]];
    for (const x of row) next.push(next[next.length - 1] + x);
    row = next;
  }
  return row[0];
}

console.log(Array.from({ length: 10 }, (_, i) => bell(i)).join(" "));
