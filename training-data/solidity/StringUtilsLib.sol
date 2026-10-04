// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library StringUtilsLib {
    function toString(uint256 value) internal pure returns (string memory) {
        if (value == 0) {
            return "0";
        }
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + (value % 10)));
            value /= 10;
        }
        return string(buffer);
    }

    function equal(string memory a, string memory b) internal pure returns (bool) {
        return keccak256(bytes(a)) == keccak256(bytes(b));
    }

    function reverse(string memory s) internal pure returns (string memory) {
        bytes memory b = bytes(s);
        bytes memory out = new bytes(b.length);
        for (uint256 i = 0; i < b.length; i++) {
            out[i] = b[b.length - 1 - i];
        }
        return string(out);
    }

    function concat(string memory a, string memory b) internal pure returns (string memory) {
        return string.concat(a, b);
    }
}

contract StringUtilsDemo {
    using StringUtilsLib for string;
    using StringUtilsLib for uint256;

    function describe(uint256 n) external pure returns (string memory) {
        return string("value=").concat(n.toString());
    }

    function same(string calldata a, string calldata b) external pure returns (bool) {
        return a.equal(b);
    }

    function flip(string calldata s) external pure returns (string memory) {
        return s.reverse();
    }
}
