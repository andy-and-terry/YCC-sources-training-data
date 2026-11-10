// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SuperperfectNumbers {
    function sigma(uint256 n) public pure returns (uint256 s) {
        for (uint256 d = 1; d <= n; d++) if (n % d == 0) s += d;
    }

    // true for 2, 4, 16, 64
    function isSuperperfect(uint256 n) external pure returns (bool) {
        return sigma(sigma(n)) == 2 * n;
    }
}
