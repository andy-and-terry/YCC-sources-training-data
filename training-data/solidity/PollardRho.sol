// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract PollardRho {
    function gcd(uint256 a, uint256 b) internal pure returns (uint256) {
        while (b != 0) (a, b) = (b, a % b);
        return a;
    }

    function rho(uint256 n) public pure returns (uint256) {
        if (n % 2 == 0) return 2;
        uint256 x = 2;
        uint256 y = 2;
        uint256 d = 1;
        while (d == 1) {
            x = (x * x + 1) % n;
            y = (y * y + 1) % n;
            y = (y * y + 1) % n;
            d = gcd(x > y ? x - y : y - x, n);
        }
        return d;
    }
}
