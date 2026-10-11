// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract EnumIterationDemo {
    enum Size { Small, Medium, Large }

    Size public current = Size.Medium;

    function setByIndex(uint8 i) external {
        require(i <= uint8(type(Size).max), "bad size");
        current = Size(i);
    }

    function minSize() external pure returns (Size) {
        return type(Size).min;
    }

    function maxSize() external pure returns (Size) {
        return type(Size).max;
    }

    function asNumber() external view returns (uint8) {
        return uint8(current);
    }
}
