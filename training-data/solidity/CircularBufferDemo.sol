// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CircularBufferDemo {
    uint256[3] public data;
    uint256 public size;
    uint256 public start;

    function push(uint256 value) external {
        uint256 index = (start + size) % data.length;
        data[index] = value;
        if (size < data.length) {
            size++;
        } else {
            start = (start + 1) % data.length;
        }
    }
}
