// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// Primorials up to 1e6, including 1; expect 8.
contract PrimorialNumbers {
    function isPrime(uint256 n) internal pure returns (bool) {
        if (n < 2) return false;
        for (uint256 d = 2; d * d <= n; d++) {
            if (n % d == 0) return false;
        }
        return true;
    }

    function count() external pure returns (uint256 c) {
        uint256 acc = 1;
        c = 1;
        for (uint256 p = 2; ; p++) {
            if (!isPrime(p)) continue;
            acc *= p;
            if (acc > 1_000_000) break;
            c++;
        }
    }
}
