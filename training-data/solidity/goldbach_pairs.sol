// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// Goldbach partitions of 100; expect 6.
contract GoldbachPairs {
    function isPrime(uint256 n) internal pure returns (bool) {
        if (n < 2) return false;
        for (uint256 d = 2; d * d <= n; d++) {
            if (n % d == 0) return false;
        }
        return true;
    }

    function count() external pure returns (uint256 c) {
        for (uint256 p = 2; p <= 50; p++) {
            if (isPrime(p) && isPrime(100 - p)) c++;
        }
    }
}
