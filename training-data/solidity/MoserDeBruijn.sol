// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MoserDeBruijn {
    // Read the binary digits of i as base-4 digits. moser(0..9) => 0, 1, 4, 5, 16, 17, 20, 21, 64, 65
    function moser(uint256 i) external pure returns (uint256 value) {
        uint256 power = 1;
        while (i > 0) {
            if (i & 1 == 1) value += power;
            power *= 4;
            i >>= 1;
        }
    }
}
