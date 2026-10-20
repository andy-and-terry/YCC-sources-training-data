// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IShape {
    function area() external view returns (uint256);
    function name() external pure returns (string memory);
}

abstract contract Base is IShape {
    uint256 internal immutable scale;
    constructor(uint256 s) { scale = s; }
    function describe() public view returns (string memory, uint256) { return (name(), area() * scale); }
}

contract Square is Base {
    uint256 public side;
    constructor(uint256 s, uint256 sc) Base(sc) { side = s; }
    function area() public view override returns (uint256) { return side * side; }
    function name() public pure override returns (string memory) { return "square"; }
}

contract Rect is Base {
    uint256 public w; uint256 public h;
    constructor(uint256 _w, uint256 _h) Base(1) { w = _w; h = _h; }
    function area() public view virtual override returns (uint256) { return w * h; }
    function name() public pure virtual override returns (string memory) { return "rect"; }
}

contract Golden is Rect {
    constructor() Rect(16, 10) {}
    function name() public pure override returns (string memory) { return string.concat("golden-", super.name()); }
}
