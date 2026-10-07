function classify(a, b, c) {
  const [x, y, z] = [a, b, c].sort((p, q) => p - q);
  if (x <= 0 || x + y <= z) return "invalid";
  if (a === b && b === c) return "equilateral";
  if (a === b || b === c || a === c) return "isosceles";
  return "scalene";
}

[[3, 3, 3], [3, 4, 4], [3, 4, 5], [1, 1, 3]].forEach((t) => console.log(t, classify(...t)));
