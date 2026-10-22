// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LuckyNumbers {
    // Lucky numbers up to 50: 1 3 7 9 13 15 21 25 31 33 37 43 49
    function lucky() public pure returns (uint256[] memory) {
        uint256[] memory nums = new uint256[](25);
        uint256 len = 0;
        for (uint256 n = 1; n <= 50; n += 2) {
            nums[len++] = n;
        }
        for (uint256 idx = 1; idx < len && nums[idx] <= len; idx++) {
            uint256 step = nums[idx];
            uint256 kept = 0;
            for (uint256 j = 0; j < len; j++) {
                if ((j + 1) % step != 0) {
                    nums[kept++] = nums[j];
                }
            }
            len = kept;
        }
        uint256[] memory out = new uint256[](len);
        for (uint256 i = 0; i < len; i++) {
            out[i] = nums[i];
        }
        return out;
    }
}
