// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract TypeConversionDemo {
    function narrow(uint256 x) external pure returns (uint8) {
        return uint8(x); // silently truncates high bits
    }

    function safeNarrow(uint256 x) external pure returns (uint8) {
        require(x <= type(uint8).max, "overflow");
        return uint8(x);
    }

    function signedToUnsigned(int256 x) external pure returns (uint256) {
        return uint256(x);
    }

    function bytesToUint(bytes32 b) external pure returns (uint256) {
        return uint256(b);
    }

    function addressToUint(address a) external pure returns (uint160) {
        return uint160(a);
    }

    function stringToBytes32(string calldata s) external pure returns (bytes32 out) {
        bytes memory b = bytes(s);
        require(b.length <= 32, "too long");
        assembly {
            out := mload(add(b, 32))
        }
    }

    function limits() external pure returns (int8 lo, int8 hi, uint16 maxU16) {
        return (type(int8).min, type(int8).max, type(uint16).max);
    }
}
