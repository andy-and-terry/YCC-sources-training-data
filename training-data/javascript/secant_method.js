function secant(f, a, b, iters = 40) {
  for (let i = 0; i < iters; i++) {
    const fa = f(a), fb = f(b);
    if (fa === fb) break;
    [a, b] = [b, b - (fb * (b - a)) / (fb - fa)];
  }
  return b;
}

console.log(secant((x) => x * x - 2, 1, 2).toFixed(8));
