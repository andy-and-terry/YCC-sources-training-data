// Jacobsthal numbers: J0 = 0, J1 = 1, Jn = J(n-1) + 2*J(n-2)
function jacobsthal(count: number): number[] {
  const terms: number[] = [];
  let [a, b] = [0, 1];
  for (let i = 0; i < count; i++) {
    terms.push(a);
    [a, b] = [b, b + 2 * a];
  }
  return terms;
}

console.log(jacobsthal(15).join(" "));
