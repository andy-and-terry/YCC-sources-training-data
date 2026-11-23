// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// n(2n^2+1)/3
contract OctahedralNumbers {
    function term(uint256 n) public pure returns (uint256) {
        return (n * (((2 * n) * n) + 1)) / 3;
    }

    function firstFifteen() public pure returns (uint256[15] memory out) {
        for (uint256 n = 1; n <= 15; n++) {
            out[n - 1] = term(n);
        }
    }
}
