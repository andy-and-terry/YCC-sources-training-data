export function fibonacciSearch(a: readonly number[], target: number): number {
  const n = a.length;
  let f2 = 0, f1 = 1, f = 1;
  while (f < n) {
    f2 = f1;
    f1 = f;
    f = f1 + f2;
  }
  let offset = -1;
  while (f > 1) {
    const i = Math.min(offset + f2, n - 1);
    if (a[i] < target) {
      f = f1; f1 = f2; f2 = f - f1; offset = i;
    } else if (a[i] > target) {
      f = f2; f1 = f1 - f2; f2 = f - f1;
    } else return i;
  }
  return f1 && offset + 1 < n && a[offset + 1] === target ? offset + 1 : -1;
}

const data = [10, 22, 35, 40, 45, 50, 80, 82, 85, 90, 100];
for (const t of [85, 10, 100, 7]) console.log(t, fibonacciSearch(data, t));
