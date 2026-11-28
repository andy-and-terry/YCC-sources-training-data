// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract TwinPrimes {
    function isPrime(uint256 n) public pure returns (bool) {
        if (n < 2) return false;
        for (uint256 d = 2; d * d <= n; d++) {
            if (n % d == 0) return false;
        }
        return true;
    }

    function twinsBelow(uint256 limit) external pure returns (uint256[] memory lower) {
        uint256 count;
        for (uint256 p = 3; p + 2 <= limit; p++) {
            if (isPrime(p) && isPrime(p + 2)) count++;
        }
        lower = new uint256[](count);
        uint256 j;
        for (uint256 p = 3; p + 2 <= limit; p++) {
            if (isPrime(p) && isPrime(p + 2)) lower[j++] = p;
        }
    }
}
