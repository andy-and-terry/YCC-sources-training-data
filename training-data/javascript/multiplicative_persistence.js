function persistence(n) {
  let steps = 0;
  while (n >= 10) {
    n = String(n).split('').reduce((acc, d) => acc * Number(d), 1);
    steps++;
  }
  return steps;
}

[39, 77, 999, 10].forEach((n) => console.log(n, persistence(n)));
