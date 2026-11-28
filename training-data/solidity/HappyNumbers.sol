// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract HappyNumbers {
    function digitSquareSum(uint256 n) internal pure returns (uint256 s) {
        while (n > 0) {
            uint256 d = n % 10;
            s += d * d;
            n /= 10;
        }
    }

    // Unhappy numbers enter a cycle, so bounding the iterations is enough.
    function isHappy(uint256 n) public pure returns (bool) {
        for (uint256 i = 0; i < 20 && n != 1; i++) {
            n = digitSquareSum(n);
        }
        return n == 1;
    }

    function firstHappy(uint256 count) external pure returns (uint256[] memory out) {
        out = new uint256[](count);
        uint256 found;
        for (uint256 n = 1; found < count; n++) {
            if (isHappy(n)) out[found++] = n; // 1 7 10 13 19 23 28 31 ...
        }
    }
}
