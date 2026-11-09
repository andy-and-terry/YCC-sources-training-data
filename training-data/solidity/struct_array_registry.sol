// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Registry {
    struct Item { string name; uint256 qty; }
    Item[] public items;
    function add(string calldata n, uint256 q) external {
        items.push(Item(n, q));
    }
    function count() external view returns (uint256) { return items.length; }
}
