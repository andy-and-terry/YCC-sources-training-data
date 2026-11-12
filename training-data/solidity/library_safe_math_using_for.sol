// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
library Math2 { function avg(uint a, uint b) internal pure returns (uint) { return (a & b) + ((a ^ b) >> 1); } }
contract Use { using Math2 for uint; function f(uint a, uint b) external pure returns (uint) { return a.avg(b); } }
