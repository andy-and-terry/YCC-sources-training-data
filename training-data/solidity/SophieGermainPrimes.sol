// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SophieGermainPrimes {
    function isPrime(uint256 n) public pure returns (bool) {
        if (n < 2) return false;
        for (uint256 i = 2; i * i <= n; i++) if (n % i == 0) return false;
        return true;
    }

    // first(10) => [2, 3, 5, 11, 23, 29, 41, 53, 83, 89]
    function first(uint256 count) external pure returns (uint256[] memory out) {
        out = new uint256[](count);
        uint256 found = 0;
        for (uint256 p = 2; found < count; p++) {
            if (isPrime(p) && isPrime(2 * p + 1)) out[found++] = p;
        }
    }
}
