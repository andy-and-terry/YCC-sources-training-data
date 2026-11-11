// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Centered square numbers 2n(n+1)+1
contract CenteredSquareNumbers {
    function term(uint256 n) public pure returns (uint256) {
        return ((2 * n) * (n + 1)) + 1;
    }

    function firstTen() public pure returns (uint256[10] memory out) {
        for (uint256 n = 0; n < 10; n++) {
            out[n] = term(n);
        }
    }
}
