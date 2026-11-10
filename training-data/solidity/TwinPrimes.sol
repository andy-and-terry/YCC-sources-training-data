// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract TwinPrimes {
    function isPrime(uint256 n) public pure returns (bool) {
        if (n < 2) return false;
        for (uint256 i = 2; i * i <= n; i++) if (n % i == 0) return false;
        return true;
    }

    // Lower members of twin pairs up to `limit`; limit = 80 => [3, 5, 11, 17, 29, 41, 59, 71]
    function lowerMembers(uint256 limit) external pure returns (uint256[] memory) {
        uint256[] memory tmp = new uint256[](limit);
        uint256 count = 0;
        for (uint256 p = 3; p + 2 <= limit; p++) {
            if (isPrime(p) && isPrime(p + 2)) tmp[count++] = p;
        }
        uint256[] memory out = new uint256[](count);
        for (uint256 i = 0; i < count; i++) out[i] = tmp[i];
        return out;
    }
}
