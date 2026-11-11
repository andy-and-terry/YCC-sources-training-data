// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Population count (number of set bits) for 0..15
contract PopcountTable {
    function bits(uint256 n) public pure returns (uint256 count) {
        while (n != 0) {
            count += n & 1;
            n >>= 1;
        }
    }

    function table() public pure returns (uint256[16] memory out) {
        for (uint256 n = 0; n < 16; n++) {
            out[n] = bits(n);
        }
    }
}
