// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IGreeter { function greet() external view returns (string memory); }

abstract contract Base is IGreeter {
    string internal name;
    constructor(string memory n) { name = n; }
}

contract Hello is Base {
    constructor() Base("world") {}
    function greet() external view override returns (string memory) {
        return string.concat("hello ", name);
    }
}
