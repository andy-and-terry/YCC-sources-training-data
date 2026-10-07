/** Three-way partition around a predicate-based classifier returning -1, 0, or 1. */
export function partition3<T>(a: T[], classify: (x: T) => -1 | 0 | 1): [number, number] {
  let lo = 0, mid = 0, hi = a.length - 1;
  const swap = (i: number, j: number): void => {
    [a[i], a[j]] = [a[j], a[i]];
  };
  while (mid <= hi) {
    const c = classify(a[mid]);
    if (c < 0) swap(lo++, mid++);
    else if (c > 0) swap(mid, hi--);
    else mid++;
  }
  return [lo, hi];
}

const colors = ["blue", "red", "white", "blue", "red", "white", "red"];
const order = { red: -1, white: 0, blue: 1 } as const;
console.log(partition3(colors, (c) => order[c as keyof typeof order]), colors);
