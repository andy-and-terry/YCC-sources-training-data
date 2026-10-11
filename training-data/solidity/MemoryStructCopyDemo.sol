// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MemoryStructCopyDemo {
    struct Point {
        int256 x;
        int256 y;
    }

    Point public stored = Point(1, 2);

    function modifyMemoryCopy() external view returns (int256, int256) {
        Point memory p = stored; // copy
        p.x = 100;
        return (p.x, stored.x);
    }

    function modifyStoragePointer() external returns (int256) {
        Point storage p = stored; // reference
        p.x = 100;
        return stored.x;
    }
}
