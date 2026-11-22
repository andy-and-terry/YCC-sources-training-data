// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Sophie Germain primes: p prime and 2p + 1 prime.
contract SophieGermainPrimes {
    function isPrime(uint256 n) public pure returns (bool) {
        if (n < 2) return false;
        for (uint256 d = 2; d * d <= n; d++) {
            if (n % d == 0) return false;
        }
        return true;
    }

    function isSophieGermain(uint256 p) public pure returns (bool) {
        return isPrime(p) && isPrime(2 * p + 1);
    }

    // countBelow(100) == 10  (2 3 5 11 23 29 41 53 83 89)
    function countBelow(uint256 limit) public pure returns (uint256 count) {
        for (uint256 p = 2; p < limit; p++) {
            if (isSophieGermain(p)) count++;
        }
    }
}
