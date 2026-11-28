function secant(f, x0, x1, tol = 1e-12, limit = 50) {
  for (let i = 0; i < limit; i++) {
    const f0 = f(x0), f1 = f(x1);
    if (f1 === f0) break;
    [x0, x1] = [x1, x1 - (f1 * (x1 - x0)) / (f1 - f0)];
    if (Math.abs(x1 - x0) < tol) break;
  }
  return x1;
}

console.log(secant((x) => x * x - 2, 1, 2));
