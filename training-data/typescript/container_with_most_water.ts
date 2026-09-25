export function maxArea(h: readonly number[]): { area: number; left: number; right: number } {
  let lo = 0, hi = h.length - 1;
  let best = { area: 0, left: 0, right: 0 };
  while (lo < hi) {
    const area = (hi - lo) * Math.min(h[lo], h[hi]);
    if (area > best.area) best = { area, left: lo, right: hi };
    if (h[lo] < h[hi]) lo++;
    else hi--;
  }
  return best;
}

console.log(maxArea([1, 8, 6, 2, 5, 4, 8, 3, 7]));
