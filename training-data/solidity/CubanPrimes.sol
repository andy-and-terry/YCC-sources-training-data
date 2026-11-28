// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract CubanPrimes {
    function isPrime(uint256 n) internal pure returns (bool) {
        if (n < 2) return false;
        for (uint256 i = 2; i * i <= n; i++) {
            if (n % i == 0) return false;
        }
        return true;
    }

    function first(uint256 count) public pure returns (uint256[] memory out) {
        out = new uint256[](count);
        uint256 found = 0;
        for (uint256 y = 1; found < count; y++) {
            uint256 p = 3 * y * y + 3 * y + 1;
            if (isPrime(p)) out[found++] = p;
        }
    }
}
