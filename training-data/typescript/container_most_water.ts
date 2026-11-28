function maxArea(h: readonly number[]): number {
  let lo = 0;
  let hi = h.length - 1;
  let best = 0;
  while (lo < hi) {
    best = Math.max(best, Math.min(h[lo], h[hi]) * (hi - lo));
    if (h[lo] < h[hi]) lo++;
    else hi--;
  }
  return best;
}

console.log(maxArea([1, 8, 6, 2, 5, 4, 8, 3, 7])); // 49
