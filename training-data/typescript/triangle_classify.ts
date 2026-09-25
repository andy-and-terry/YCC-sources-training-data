type Kind = "equilateral" | "isosceles" | "scalene" | "invalid";

export function classify(a: number, b: number, c: number): Kind {
  const [x, y, z] = [a, b, c].sort((p, q) => p - q);
  if (x <= 0 || x + y <= z) return "invalid";
  const unique = new Set([a, b, c]).size;
  return unique === 1 ? "equilateral" : unique === 2 ? "isosceles" : "scalene";
}

console.log(classify(2, 2, 2), classify(2, 3, 3), classify(3, 4, 5), classify(1, 2, 3));
