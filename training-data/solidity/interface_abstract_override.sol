// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IGreeter { function greet() external view returns (string memory); }

abstract contract Base is IGreeter {
    function shout() external view returns (string memory) { return string.concat(greet(), "!"); }
}

contract Hello is Base {
    function greet() public pure override returns (string memory) { return "hello"; }
}
