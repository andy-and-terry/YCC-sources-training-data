// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Pernicious numbers: the popcount is prime.
contract PerniciousNumbers {
    function popcount(uint256 n) public pure returns (uint256 c) {
        while (n > 0) {
            c += n & 1;
            n >>= 1;
        }
    }

    function isPrime(uint256 n) public pure returns (bool) {
        if (n < 2) return false;
        for (uint256 d = 2; d * d <= n; d++) {
            if (n % d == 0) return false;
        }
        return true;
    }

    function isPernicious(uint256 n) public pure returns (bool) {
        return isPrime(popcount(n));
    }
}
