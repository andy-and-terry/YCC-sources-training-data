// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Cantor pairing function and its inverse.
contract CantorPairing {
    function pair(uint256 x, uint256 y) public pure returns (uint256) {
        return (x + y) * (x + y + 1) / 2 + y;
    }

    function isqrt(uint256 n) internal pure returns (uint256 r) {
        while ((r + 1) * (r + 1) <= n) r++;
    }

    // unpair(32) == (3, 4)
    function unpair(uint256 z) public pure returns (uint256 x, uint256 y) {
        uint256 w = (isqrt(8 * z + 1) - 1) / 2;
        y = z - w * (w + 1) / 2;
        x = w - y;
    }
}
