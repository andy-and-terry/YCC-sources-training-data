function flip(a: number[], k: number): void {
  for (let i = 0; i < k; i++, k--) [a[i], a[k]] = [a[k], a[i]];
}

export function pancakeSort(items: readonly number[]): { sorted: number[]; flips: number[] } {
  const a = [...items];
  const flips: number[] = [];
  for (let size = a.length; size > 1; size--) {
    let maxIdx = 0;
    for (let i = 1; i < size; i++) if (a[i] > a[maxIdx]) maxIdx = i;
    if (maxIdx === size - 1) continue;
    if (maxIdx > 0) {
      flip(a, maxIdx);
      flips.push(maxIdx + 1);
    }
    flip(a, size - 1);
    flips.push(size);
  }
  return { sorted: a, flips };
}

console.log(pancakeSort([23, 10, 20, 11, 12, 6, 7]));
