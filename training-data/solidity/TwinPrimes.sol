// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Twin primes: pairs (p, p+2) both prime.
contract TwinPrimes {
    function isPrime(uint256 n) public pure returns (bool) {
        if (n < 2) return false;
        for (uint256 d = 2; d * d <= n; d++) {
            if (n % d == 0) return false;
        }
        return true;
    }

    function isTwinLesser(uint256 p) public pure returns (bool) {
        return isPrime(p) && isPrime(p + 2);
    }

    // countBelow(100) == 8  (3 5 11 17 29 41 59 71)
    function countBelow(uint256 limit) public pure returns (uint256 count) {
        for (uint256 p = 2; p < limit; p++) {
            if (isTwinLesser(p)) count++;
        }
    }
}
