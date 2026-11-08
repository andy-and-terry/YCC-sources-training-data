// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Crc8Checksum {
    function crc8(bytes memory data) public pure returns (uint8 crc) {
        for (uint i = 0; i < data.length; i++) {
            crc ^= uint8(data[i]);
            for (uint k = 0; k < 8; k++) {
                crc = (crc & 0x80) != 0 ? uint8((uint16(crc) << 1) ^ 0x07) : uint8(uint16(crc) << 1);
            }
        }
    }
}
