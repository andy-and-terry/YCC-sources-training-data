function maxArea(h) {
  let lo = 0, hi = h.length - 1, best = 0;
  while (lo < hi) {
    best = Math.max(best, (hi - lo) * Math.min(h[lo], h[hi]));
    if (h[lo] < h[hi]) lo++;
    else hi--;
  }
  return best;
}

console.log(maxArea([1, 8, 6, 2, 5, 4, 8, 3, 7]));
module.exports = { maxArea };
