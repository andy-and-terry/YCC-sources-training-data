// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SemiprimeCheck {
    function primeFactorCount(uint256 n) public pure returns (uint256 count) {
        for (uint256 p = 2; p * p <= n; p++) {
            while (n % p == 0) {
                n /= p;
                count++;
            }
        }
        if (n > 1) count++;
    }

    function isSemiprime(uint256 n) public pure returns (bool) {
        return primeFactorCount(n) == 2;
    }
}
