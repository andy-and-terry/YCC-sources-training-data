// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract GoldbachPairs {
    function isPrime(uint256 n) internal pure returns (bool) {
        if (n < 2) return false;
        for (uint256 d = 2; d * d <= n; d++) {
            if (n % d == 0) return false;
        }
        return true;
    }

    function firstPair(uint256 n) external pure returns (uint256 p, uint256 q) {
        require(n > 2 && n % 2 == 0, "need even n > 2");
        for (p = 2; p <= n / 2; p++) {
            if (isPrime(p) && isPrime(n - p)) return (p, n - p);
        }
        revert("no pair found");
    }
}
