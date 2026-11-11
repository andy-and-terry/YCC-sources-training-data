// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// Repunits: numbers made only of the digit 1.
contract RepunitNumbers {
    function repunits(uint256 count) external pure returns (uint256[] memory out) {
        out = new uint256[](count);
        uint256 r = 0;
        for (uint256 i = 0; i < count; i++) {
            r = r * 10 + 1;
            out[i] = r;
        }
    }
}
