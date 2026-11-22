// Euler zigzag numbers via the Seidel-Entringer boustrophedon.
let row: number[] = [1];
const out: number[] = [1];
for (let i = 0; i < 9; i++) {
  const next: number[] = [0];
  for (const x of [...row].reverse()) next.push(next[next.length - 1] + x);
  row = next;
  out.push(row[row.length - 1]);
}
console.log(out.join(" "));
