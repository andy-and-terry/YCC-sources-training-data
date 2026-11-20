// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract GoldbachPair {
    function isPrime(uint256 n) public pure returns (bool) {
        if (n < 2) return false;
        for (uint256 d = 2; d * d <= n; d++) if (n % d == 0) return false;
        return true;
    }

    function goldbach(uint256 n) public pure returns (uint256, uint256) {
        for (uint256 p = 2; p <= n / 2; p++) if (isPrime(p) && isPrime(n - p)) return (p, n - p);
        revert("no pair");
    }
}
