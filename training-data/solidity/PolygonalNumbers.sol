// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PolygonalNumbers {
    // n-th s-gonal number: ((s - 2) * n^2 - (s - 4) * n) / 2, rearranged to avoid uint underflow
    function polygonal(uint256 s, uint256 n) public pure returns (uint256) {
        return ((s - 2) * n * n + 4 * n - s * n) / 2;
    }

    function firstTen(uint256 s) public pure returns (uint256[10] memory out) {
        for (uint256 i = 0; i < 10; i++) {
            out[i] = polygonal(s, i + 1);
        }
    }

    function triangular() external pure returns (uint256[10] memory) {
        return firstTen(3);
    }

    function pentagonal() external pure returns (uint256[10] memory) {
        return firstTen(5);
    }

    function hexagonal() external pure returns (uint256[10] memory) {
        return firstTen(6);
    }
}
