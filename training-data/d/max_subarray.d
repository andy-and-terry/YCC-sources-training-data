import std.stdio;
import std.algorithm : max;

int maxSubArray(int[] nums) {
    int maxSoFar = nums[0];
    int maxEndingHere = nums[0];
    foreach (i; 1 .. nums.length) {
        maxEndingHere = max(nums[i], maxEndingHere + nums[i]);
        maxSoFar = max(maxSoFar, maxEndingHere);
    }
    return maxSoFar;
}

void main() {
    writeln(maxSubArray([-2, 1, -3, 4, -1, 2, 1, -5, 4]));
}
