// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract TriangularNumbers {
    function triangular(uint256 n) public pure returns (uint256) {
        return (n * (n + 1)) / 2;
    }

    function isTriangular(uint256 t) public pure returns (bool) {
        uint256 d = 8 * t + 1;
        uint256 r = 0;
        while ((r + 1) * (r + 1) <= d) r++;
        return r * r == d;
    }
}
