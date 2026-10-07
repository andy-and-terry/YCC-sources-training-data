function trap(h) {
  let lo = 0, hi = h.length - 1, leftMax = 0, rightMax = 0, water = 0;
  while (lo < hi) {
    if (h[lo] < h[hi]) {
      leftMax = Math.max(leftMax, h[lo]);
      water += leftMax - h[lo++];
    } else {
      rightMax = Math.max(rightMax, h[hi]);
      water += rightMax - h[hi--];
    }
  }
  return water;
}

console.log(trap([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]), trap([4, 2, 0, 3, 2, 5]));
module.exports = { trap };
