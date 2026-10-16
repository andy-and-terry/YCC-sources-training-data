// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract StringEqualityDemo {
    function equal(string memory a, string memory b) public pure returns (bool) {
        return keccak256(bytes(a)) == keccak256(bytes(b));
    }

    function lengthOf(string memory s) public pure returns (uint256) {
        return bytes(s).length;
    }

    function concat(string memory a, string memory b) public pure returns (string memory) {
        return string.concat(a, " ", b);
    }
}
