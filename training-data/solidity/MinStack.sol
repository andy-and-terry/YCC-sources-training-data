// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MinStack {
    struct Entry { uint256 value; uint256 min; }
    Entry[] private items;

    function push(uint256 x) external {
        uint256 m = items.length == 0 ? x : (x < items[items.length - 1].min ? x : items[items.length - 1].min);
        items.push(Entry(x, m));
    }

    function pop() external returns (uint256) {
        Entry memory e = items[items.length - 1];
        items.pop();
        return e.value;
    }

    function minimum() external view returns (uint256) {
        return items[items.length - 1].min;
    }
}
