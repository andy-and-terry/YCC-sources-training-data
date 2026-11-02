// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IShape { function area() external view returns (uint256); }

contract Square is IShape {
    uint256 public side;
    constructor(uint256 s) { side = s; }
    function area() external view override returns (uint256) { return side * side; }
}
