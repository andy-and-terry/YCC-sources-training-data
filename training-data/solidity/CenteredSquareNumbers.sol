// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Centered square numbers: n^2 + (n+1)^2.
contract CenteredSquareNumbers {
    function centeredSquare(uint256 n) public pure returns (uint256) {
        return n * n + (n + 1) * (n + 1);
    }

    function firstTen() public pure returns (uint256[10] memory out) {
        for (uint256 n = 0; n < 10; n++) out[n] = centeredSquare(n);
    }
}
