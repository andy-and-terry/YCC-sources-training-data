// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// Emirps: primes whose digit reversal is a different prime.
contract EmirpNumbers {
    function isPrime(uint256 n) public pure returns (bool) {
        if (n < 2) return false;
        for (uint256 i = 2; i * i <= n; i++) {
            if (n % i == 0) return false;
        }
        return true;
    }

    function reverseDigits(uint256 n) public pure returns (uint256 r) {
        while (n > 0) {
            r = r * 10 + n % 10;
            n /= 10;
        }
    }

    function isEmirp(uint256 n) external pure returns (bool) {
        uint256 r = reverseDigits(n);
        return r != n && isPrime(n) && isPrime(r);
    }
}
