// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Pronic numbers n(n+1)
contract PronicNumbers {
    function term(uint256 n) public pure returns (uint256) {
        return n * (n + 1);
    }

    function firstTen() public pure returns (uint256[10] memory out) {
        for (uint256 n = 0; n < 10; n++) {
            out[n] = term(n);
        }
    }
}
