// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IShape {
    function area() external view returns (uint256);
}

abstract contract Shape is IShape {
    function describe() external view returns (string memory) {
        return "A shape with an area";
    }
}

contract Rectangle is Shape {
    uint256 public width;
    uint256 public height;

    constructor(uint256 _width, uint256 _height) {
        width = _width;
        height = _height;
    }

    function area() external view override returns (uint256) {
        return width * height;
    }
}
