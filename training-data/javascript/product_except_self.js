function productExceptSelf(nums) {
  const out = new Array(nums.length).fill(1);
  let prefix = 1;
  for (let i = 0; i < nums.length; i++) {
    out[i] = prefix;
    prefix *= nums[i];
  }
  let suffix = 1;
  for (let i = nums.length - 1; i >= 0; i--) {
    out[i] *= suffix;
    suffix *= nums[i];
  }
  return out.map((v) => v + 0); // normalise -0
}

console.log(productExceptSelf([1, 2, 3, 4]), productExceptSelf([-1, 1, 0, -3, 3]));
module.exports = { productExceptSelf };
