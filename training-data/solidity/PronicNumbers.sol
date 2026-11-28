// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract PronicNumbers {
    // Integer square root using the Babylonian method.
    function isqrt(uint256 x) internal pure returns (uint256 y) {
        if (x == 0) return 0;
        y = x;
        uint256 z = (x + 1) / 2;
        while (z < y) {
            y = z;
            z = (x / z + z) / 2;
        }
    }

    function isPronic(uint256 x) public pure returns (bool) {
        uint256 n = isqrt(x);
        return n * (n + 1) == x;
    }

    function first(uint256 count) external pure returns (uint256[] memory out) {
        out = new uint256[](count);
        for (uint256 n = 0; n < count; n++) out[n] = n * (n + 1); // 0 2 6 12 20 ...
    }
}
