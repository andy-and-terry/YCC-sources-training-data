// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract BitReversal {
    function reverse8(uint8 v) public pure returns (uint8 r) {
        for (uint8 i = 0; i < 8; i++) {
            r = (r << 1) | (v & 1);
            v >>= 1;
        }
    }

    function check() external pure returns (uint8, uint8, uint8, uint8) {
        return (reverse8(1), reverse8(6), reverse8(13), reverse8(128)); // 128 96 176 1
    }
}
