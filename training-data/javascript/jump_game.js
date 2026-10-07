function canJump(nums) {
  let reach = 0;
  for (let i = 0; i < nums.length; i++) {
    if (i > reach) return false;
    reach = Math.max(reach, i + nums[i]);
  }
  return true;
}

function minJumps(nums) {
  let jumps = 0, end = 0, far = 0;
  for (let i = 0; i < nums.length - 1; i++) {
    far = Math.max(far, i + nums[i]);
    if (i === end) {
      jumps++;
      end = far;
    }
  }
  return jumps;
}

console.log(canJump([2, 3, 1, 1, 4]), canJump([3, 2, 1, 0, 4]), minJumps([2, 3, 1, 1, 4]));
module.exports = { canJump, minJumps };
