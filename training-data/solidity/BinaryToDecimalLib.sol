// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library BinaryToDecimalLib {
    function convert(string memory binary) internal pure returns (uint256) {
        bytes memory b = bytes(binary);
        uint256 result = 0;
        for (uint256 i = 0; i < b.length; i++) {
            result = result * 2 + (uint8(b[i]) - uint8(bytes1("0")));
        }
        return result;
    }
}
