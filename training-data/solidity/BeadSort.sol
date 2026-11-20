// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BeadSort {
    // Bead (gravity) sort for small non-negative integers.
    function sort(uint256[] memory nums) public pure returns (uint256[] memory out) {
        uint256 max = 0;
        for (uint256 i = 0; i < nums.length; i++) if (nums[i] > max) max = nums[i];
        uint256[] memory cols = new uint256[](max);
        for (uint256 i = 0; i < nums.length; i++)
            for (uint256 j = 0; j < nums[i]; j++) cols[j]++;
        out = new uint256[](nums.length);
        for (uint256 r = 0; r < nums.length; r++) {
            uint256 c = 0;
            for (uint256 j = 0; j < max; j++) if (cols[j] > r) c++;
            out[nums.length - 1 - r] = c;
        }
    }
}
