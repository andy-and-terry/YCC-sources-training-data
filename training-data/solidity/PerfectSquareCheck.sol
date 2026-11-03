// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract PerfectSquareCheck {
    function isqrt(uint256 n) public pure returns (uint256 r) {
        if (n == 0) return 0;
        r = n;
        uint256 x = (n + 1) / 2;
        while (x < r) {
            r = x;
            x = (n / x + x) / 2;
        }
    }

    function isPerfectSquare(uint256 n) public pure returns (bool) {
        uint256 r = isqrt(n);
        return r * r == n;
    }
}
