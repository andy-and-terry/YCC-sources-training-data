// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1.
contract RepunitNumbers {
    function repunit(uint256 n) public pure returns (uint256 r) {
        for (uint256 i = 0; i < n; i++) r = r * 10 + 1;
    }

    function divisibleByThree(uint256 n) public pure returns (bool) {
        return repunit(n) % 3 == 0;
    }
}
