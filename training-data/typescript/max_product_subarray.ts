export function maxProductSubarray(nums: readonly number[]): { product: number; start: number; end: number } {
  let best = { product: nums[0], start: 0, end: 0 };
  let hi = { v: nums[0], s: 0 };
  let lo = { v: nums[0], s: 0 };
  for (let i = 1; i < nums.length; i++) {
    const x = nums[i];
    const cands = [
      { v: x, s: i },
      { v: hi.v * x, s: hi.s },
      { v: lo.v * x, s: lo.s },
    ];
    hi = cands.reduce((a, b) => (b.v > a.v ? b : a));
    lo = cands.reduce((a, b) => (b.v < a.v ? b : a));
    if (hi.v > best.product) best = { product: hi.v, start: hi.s, end: i };
  }
  return best;
}

for (const a of [[2, 3, -2, 4], [-2, 0, -1], [-2, 3, -4], [1, -2, -3, 0, 7, -8, -2]]) console.log(a, maxProductSubarray(a));
