// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
interface IGreeter { function greet() external pure returns (string memory); }
abstract contract Base is IGreeter { function twice() external pure returns (string memory) { return "x"; } }
contract Impl is Base { function greet() external pure override returns (string memory) { return "hi"; } }
