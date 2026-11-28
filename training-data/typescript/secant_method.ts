type Fn = (x: number) => number;

function secant(f: Fn, x0: number, x1: number, tol = 1e-12, limit = 50): number {
  for (let i = 0; i < limit; i++) {
    const f0 = f(x0);
    const f1 = f(x1);
    if (f1 === f0) break;
    [x0, x1] = [x1, x1 - (f1 * (x1 - x0)) / (f1 - f0)];
    if (Math.abs(x1 - x0) < tol) break;
  }
  return x1;
}

console.log(secant((x) => x * x - 2, 1, 2));
