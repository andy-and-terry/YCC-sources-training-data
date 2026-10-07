// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract StringUtilsDemo {
    function concat(string calldata a, string calldata b) external pure returns (string memory) {
        return string.concat(a, " ", b);
    }

    function length(string calldata s) external pure returns (uint256) {
        return bytes(s).length;
    }

    function equal(string calldata a, string calldata b) external pure returns (bool) {
        return keccak256(bytes(a)) == keccak256(bytes(b));
    }

    function reverse(string calldata s) external pure returns (string memory) {
        bytes memory b = bytes(s);
        bytes memory out = new bytes(b.length);
        for (uint256 i = 0; i < b.length; i++) {
            out[i] = b[b.length - 1 - i];
        }
        return string(out);
    }

    function toUpper(string calldata s) external pure returns (string memory) {
        bytes memory b = bytes(s);
        for (uint256 i = 0; i < b.length; i++) {
            if (b[i] >= 0x61 && b[i] <= 0x7a) {
                b[i] = bytes1(uint8(b[i]) - 32);
            }
        }
        return string(b);
    }

    function toString(uint256 value) external pure returns (string memory) {
        if (value == 0) return "0";
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + value % 10));
            value /= 10;
        }
        return string(buffer);
    }
}
