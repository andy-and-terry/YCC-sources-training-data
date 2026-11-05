// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

abstract contract Shape {
    function area() public view virtual returns (uint256);
    function describe() public view returns (string memory) { return area() > 10 ? "big" : "small"; }
}

contract Square is Shape {
    uint256 side = 4;
    function area() public view override returns (uint256) { return side * side; }
}
