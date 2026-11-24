// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Fibbinary numbers: no two adjacent 1 bits.
contract FibbinaryNumbers {
    function isFibbinary(uint256 n) public pure returns (bool) {
        return n & (n >> 1) == 0;
    }

    function countBelow(uint256 limit) public pure returns (uint256 count) {
        for (uint256 n = 0; n < limit; n++) if (isFibbinary(n)) count++;
    }
}
