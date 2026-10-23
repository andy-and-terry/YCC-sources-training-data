// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UncheckedMathLoopDemo {
    function sum(uint256[] calldata xs) external pure returns (uint256 total) {
        uint256 n = xs.length;
        for (uint256 i = 0; i < n; ) {
            total += xs[i];
            unchecked { ++i; } // i cannot overflow, skip the check
        }
    }

    function wrap() external pure returns (uint8) {
        unchecked { return uint8(255) + 1; } // wraps to 0
    }
}
