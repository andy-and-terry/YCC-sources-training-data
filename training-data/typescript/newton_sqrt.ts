export function newtonRoot(f: (x: number) => number, df: (x: number) => number, x0: number, tol = 1e-12, maxIter = 100): number {
  let x = x0;
  for (let i = 0; i < maxIter; i++) {
    const next = x - f(x) / df(x);
    if (Math.abs(next - x) < tol) return next;
    x = next;
  }
  throw new Error("did not converge");
}

export const newtonSqrt = (a: number): number => {
  if (a < 0) throw new RangeError("negative input");
  return a === 0 ? 0 : newtonRoot((x) => x * x - a, (x) => 2 * x, Math.max(a, 1));
};

for (const v of [2, 9, 0.25, 1e10]) console.log(v, newtonSqrt(v));
console.log("root of x^3 - 2x - 5:", newtonRoot((x) => x ** 3 - 2 * x - 5, (x) => 3 * x ** 2 - 2, 2));
