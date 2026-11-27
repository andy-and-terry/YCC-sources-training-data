// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Fletcher16Checksum {
    function fletcher16(bytes memory data) public pure returns (uint16) {
        uint16 s1 = 0;
        uint16 s2 = 0;
        for (uint256 i = 0; i < data.length; i++) {
            s1 = (s1 + uint8(data[i])) % 255;
            s2 = (s2 + s1) % 255;
        }
        return (s2 << 8) | s1;
    }
}
