// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract VarintEncode {
    function encode(uint n) public pure returns (bytes memory) {
        bytes memory tmp = new bytes(10);
        uint len = 0;
        while (n >= 0x80) {
            tmp[len++] = bytes1(uint8((n & 0x7F) | 0x80));
            n >>= 7;
        }
        tmp[len++] = bytes1(uint8(n));
        bytes memory out = new bytes(len);
        for (uint i = 0; i < len; i++) out[i] = tmp[i];
        return out;
    }
}
