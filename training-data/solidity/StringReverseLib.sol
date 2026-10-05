// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library StringReverseLib {
    function reverse(string memory input) internal pure returns (string memory) {
        bytes memory data = bytes(input);
        uint256 length = data.length;
        bytes memory result = new bytes(length);
        for (uint256 i = 0; i < length; i++) {
            result[i] = data[length - 1 - i];
        }
        return string(result);
    }
}

contract StringReverseDemo {
    function reverse(string calldata s) external pure returns (string memory) {
        return StringReverseLib.reverse(s);
    }
}
