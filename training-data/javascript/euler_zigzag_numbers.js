// Euler zigzag numbers via the Seidel-Entringer boustrophedon.
let row = [1];
const out = [1];
for (let i = 0; i < 9; i++) {
  const next = [0];
  for (let j = row.length - 1; j >= 0; j--) next.push(next[next.length - 1] + row[j]);
  row = next;
  out.push(row[row.length - 1]);
}
console.log(out.join(" "));
