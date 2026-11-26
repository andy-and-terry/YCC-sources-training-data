// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// Sexy primes below 100; expect 16 pairs.
contract SexyPrimes {
    function isPrime(uint256 n) internal pure returns (bool) {
        if (n < 2) return false;
        for (uint256 d = 2; d * d <= n; d++) {
            if (n % d == 0) return false;
        }
        return true;
    }

    function count() external pure returns (uint256 c) {
        for (uint256 p = 2; p < 100; p++) {
            if (isPrime(p) && isPrime(p + 6)) c++;
        }
    }
}
