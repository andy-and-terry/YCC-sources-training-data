// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract Hasher {
    function h(string calldata s, uint n) external pure returns (bytes32) { return keccak256(abi.encodePacked(s, n)); }
}
