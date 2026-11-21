// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
contract KeithNumbers {
    function isKeith(uint256 n) public pure returns (bool) {
        uint256[64] memory seq;
        uint256 k = 0;
        for (uint256 m = n; m > 0; m /= 10) k++;
        uint256 m2 = n;
        for (uint256 i = k; i > 0; i--) {
            seq[i - 1] = m2 % 10;
            m2 /= 10;
        }
        uint256 len = k;
        while (seq[len - 1] < n) {
            uint256 sum = 0;
            for (uint256 i = len - k; i < len; i++) sum += seq[i];
            seq[len] = sum;
            len++;
        }
        return seq[len - 1] == n;
    }
}
