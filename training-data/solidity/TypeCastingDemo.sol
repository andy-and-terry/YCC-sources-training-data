// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract TypeCastingDemo {
    function narrow(uint256 x) external pure returns (uint8) {
        return uint8(x); // silently truncates high bits
    }

    function safeNarrow(uint256 x) external pure returns (uint8) {
        require(x <= type(uint8).max, "overflow");
        return uint8(x);
    }

    function widen(uint8 x) external pure returns (uint256) {
        return x;
    }

    function signedToUnsigned(int256 x) external pure returns (uint256) {
        require(x >= 0, "negative");
        return uint256(x);
    }

    function bytesToUint(bytes4 b) external pure returns (uint32) {
        return uint32(b);
    }

    function stringToBytes32(string calldata s) external pure returns (bytes32 out) {
        bytes memory b = bytes(s);
        require(b.length <= 32, "too long");
        assembly {
            out := mload(add(b, 32))
        }
    }

    function addressToUint(address a) external pure returns (uint160) {
        return uint160(a);
    }

    function limits() external pure returns (uint8, int8, uint256) {
        return (type(uint8).max, type(int8).min, type(uint256).max);
    }
}
