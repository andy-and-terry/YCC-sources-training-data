// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Hexagonal numbers: n(2n-1).
contract HexagonalNumbers {
    function hexagonal(uint256 n) public pure returns (uint256) {
        return n * (2 * n - 1);
    }

    function firstTen() public pure returns (uint256[10] memory out) {
        for (uint256 n = 1; n <= 10; n++) out[n - 1] = hexagonal(n);
    }
}
