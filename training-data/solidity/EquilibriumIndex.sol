// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract EquilibriumIndex {
    function find(int256[] memory nums) public pure returns (int256) {
        int256 total;
        int256 left;
        for (uint256 i = 0; i < nums.length; i++) total += nums[i];
        for (uint256 i = 0; i < nums.length; i++) {
            if (left == total - left - nums[i]) return int256(i);
            left += nums[i];
        }
        return -1;
    }
}
