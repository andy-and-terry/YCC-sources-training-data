// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IGreeter {
    function greet() external view returns (string memory);
}

contract Hello is IGreeter {
    function greet() external pure override returns (string memory) {
        return "hello";
    }
}
