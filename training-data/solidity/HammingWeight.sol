// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract HammingWeight {
    function popcount(uint256 n) public pure returns (uint256 c) {
        while (n != 0) {
            n &= n - 1;
            c++;
        }
    }

    function hammingDistance(uint256 a, uint256 b) external pure returns (uint256) {
        return popcount(a ^ b);
    }
}
