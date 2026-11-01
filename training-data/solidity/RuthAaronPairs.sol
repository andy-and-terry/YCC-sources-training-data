// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Consecutive n, n+1 with equal sums of prime factors (with multiplicity).
contract RuthAaronPairs {
    function sopfr(uint256 n) public pure returns (uint256 total) {
        for (uint256 p = 2; p * p <= n; p++) {
            while (n % p == 0) {
                total += p;
                n /= p;
            }
        }
        if (n > 1) total += n;
    }

    function isPair(uint256 n) public pure returns (bool) {
        return sopfr(n) == sopfr(n + 1);
    }
}
