// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Tetrahedral numbers n(n+1)(n+2)/6
contract TetrahedralNumbers {
    function term(uint256 n) public pure returns (uint256) {
        return ((n * (n + 1)) * (n + 2))/6;
    }

    function firstTen() public pure returns (uint256[10] memory out) {
        for (uint256 n = 0; n < 10; n++) {
            out[n] = term(n);
        }
    }
}
