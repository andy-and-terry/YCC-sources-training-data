// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// Count contiguous subarrays whose sum equals k (O(n^2) running sums).
contract SubarraySumEqualsK {
    function countSubarrays(int256[] calldata nums, int256 k) external pure returns (uint256 count) {
        for (uint256 i = 0; i < nums.length; i++) {
            int256 sum = 0;
            for (uint256 j = i; j < nums.length; j++) {
                sum += nums[j];
                if (sum == k) count++;
            }
        }
    }
}
