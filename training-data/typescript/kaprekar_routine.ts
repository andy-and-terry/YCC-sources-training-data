function kaprekarSteps(n: number): number {
  let steps = 0;
  while (n !== 6174) {
    const d = String(n).padStart(4, "0").split("").sort();
    n = Number(d.slice().reverse().join("")) - Number(d.join(""));
    steps++;
  }
  return steps;
}

console.log(kaprekarSteps(3524));
