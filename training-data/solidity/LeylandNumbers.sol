// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Leyland numbers: x^y + y^x for x >= y >= 2.
contract LeylandNumbers {
    function leyland(uint256 x, uint256 y) public pure returns (uint256) {
        return x ** y + y ** x;
    }

    // Returns 8, 17, 54, 32, 145, 512.
    function firstSix() external pure returns (uint256[6] memory out) {
        uint256 idx;
        for (uint256 x = 2; x <= 4; x++) {
            for (uint256 y = 2; y <= x; y++) {
                out[idx++] = leyland(x, y);
            }
        }
    }
}
