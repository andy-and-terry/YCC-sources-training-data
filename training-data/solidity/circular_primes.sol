// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// Circular primes below 100 (digit rotation by arithmetic); expect 13.
contract CircularPrimes {
    function isPrime(uint256 n) internal pure returns (bool) {
        if (n < 2) return false;
        for (uint256 d = 2; d * d <= n; d++) {
            if (n % d == 0) return false;
        }
        return true;
    }
    function circular(uint256 n) internal pure returns (bool) {
        uint256 scale = 1;
        uint256 digits = 1;
        while (scale * 10 <= n) {
            scale *= 10;
            digits++;
        }
        uint256 x = n;
        for (uint256 i = 0; i < digits; i++) {
            if (!isPrime(x)) return false;
            x = (x % 10) * scale + x / 10;
        }
        return true;
    }

    function count() external pure returns (uint256 c) {
        for (uint256 n = 2; n < 100; n++) {
            if (circular(n)) c++;
        }
    }
}
