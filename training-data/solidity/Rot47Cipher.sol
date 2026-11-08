// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Rot47Cipher {
    function rot47(string memory s) public pure returns (string memory) {
        bytes memory b = bytes(s);
        for (uint i = 0; i < b.length; i++) {
            uint8 c = uint8(b[i]);
            if (c >= 33 && c <= 126) b[i] = bytes1(uint8(33 + (c - 33 + 47) % 94));
        }
        return string(b);
    }
}
