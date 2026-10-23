function trap(height) {
  let l = 0, r = height.length - 1;
  let lmax = 0, rmax = 0, total = 0;
  while (l < r) {
    if (height[l] < height[r]) {
      lmax = Math.max(lmax, height[l]);
      total += lmax - height[l++];
    } else {
      rmax = Math.max(rmax, height[r]);
      total += rmax - height[r--];
    }
  }
  return total;
}

console.log(trap([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]));
console.log(trap([4, 2, 0, 3, 2, 5]));
console.log(trap([1, 2, 3]));
