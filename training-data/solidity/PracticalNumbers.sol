// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Practical numbers: every m in 1..n is a sum of distinct divisors of n.
contract PracticalNumbers {
    function isPractical(uint256 n) public pure returns (bool) {
        uint256 reach = 1; // bit i set <=> i is a subset sum
        for (uint256 d = 1; d <= n; d++) {
            if (n % d == 0) reach |= reach << d;
        }
        uint256 mask = (uint256(1) << (n + 1)) - 1;
        return (reach & mask) == mask;
    }

    // countUpTo(40) == 15  (1 2 4 6 8 12 16 18 20 24 28 30 32 36 40)
    function countUpTo(uint256 limit) public pure returns (uint256 count) {
        for (uint256 n = 1; n <= limit; n++) {
            if (isPractical(n)) count++;
        }
    }
}
