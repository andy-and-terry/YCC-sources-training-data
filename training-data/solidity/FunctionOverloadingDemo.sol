// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract FunctionOverloadingDemo {
    function describe(uint256 x) public pure returns (string memory) {
        return "uint";
    }

    function describe(int256 x) public pure returns (string memory) {
        return "int";
    }

    function describe(string memory s) public pure returns (string memory) {
        return bytes(s).length == 0 ? "empty string" : "string";
    }

    function describe(address a) public pure returns (string memory) {
        return a == address(0) ? "zero address" : "address";
    }
}
