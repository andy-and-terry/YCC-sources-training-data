// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract LazyCaterer {
    // pieces(0..9) => 1, 2, 4, 7, 11, 16, 22, 29, 37, 46
    function pieces(uint256 cuts) external pure returns (uint256) {
        return (cuts * cuts + cuts + 2) / 2;
    }
}
