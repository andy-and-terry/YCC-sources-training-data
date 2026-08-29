// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library TwoSumLib {
    function findPair(uint256[] memory nums, uint256 target) internal pure returns (uint256, uint256) {
        for (uint256 i = 0; i < nums.length; i++) {
            for (uint256 j = i + 1; j < nums.length; j++) {
                if (nums[i] + nums[j] == target) {
                    return (i, j);
                }
            }
        }
        revert("No pair found");
    }
}
