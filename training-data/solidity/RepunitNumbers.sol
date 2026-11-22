// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1.
contract RepunitNumbers {
    function repunit(uint256 k) public pure returns (uint256 r) {
        for (uint256 i = 0; i < k; i++) r = r * 10 + 1; // repunit(8) == 11111111
    }

    function closedForm(uint256 k) public pure returns (uint256) {
        return (10 ** k - 1) / 9;
    }
}
