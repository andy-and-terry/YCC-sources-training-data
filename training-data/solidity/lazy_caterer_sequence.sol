// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// n(n+1)/2+1
contract LazyCatererSequence {
    function term(uint256 n) public pure returns (uint256) {
        return ((n * (n + 1)) / 2) + 1;
    }

    function firstFifteen() public pure returns (uint256[15] memory out) {
        for (uint256 n = 1; n <= 15; n++) {
            out[n - 1] = term(n);
        }
    }
}
