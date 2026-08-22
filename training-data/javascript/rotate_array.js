function rotate(nums, k) {
  const n = nums.length;
  k = ((k % n) + n) % n;
  return [...nums.slice(-k), ...nums.slice(0, n - k)];
}

console.log(rotate([1, 2, 3, 4, 5, 6, 7], 3));
module.exports = { rotate };
