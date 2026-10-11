// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract DynamicBytesPackingDemo {
    function packed(uint8 a, uint16 b, address c) external pure returns (bytes memory) {
        return abi.encodePacked(a, b, c);
    }

    function padded(uint8 a, uint16 b) external pure returns (bytes memory) {
        return abi.encode(a, b);
    }

    function hashIt(string calldata s, uint256 n) external pure returns (bytes32) {
        return keccak256(abi.encodePacked(s, n));
    }

    function decode(bytes calldata data) external pure returns (uint256 a, bool b) {
        (a, b) = abi.decode(data, (uint256, bool));
    }
}
