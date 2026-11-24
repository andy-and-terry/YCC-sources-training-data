// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Pentagonal numbers: n(3n-1)/2.
contract PentagonalNumbers {
    function pentagonal(uint256 n) public pure returns (uint256) {
        return n * (3 * n - 1) / 2;
    }

    function isPentagonal(uint256 x) public pure returns (bool) {
        for (uint256 n = 1; pentagonal(n) <= x; n++) if (pentagonal(n) == x) return true;
        return false;
    }
}
