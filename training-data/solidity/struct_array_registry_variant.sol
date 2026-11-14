// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Registry {
    struct Item { string name; uint256 qty; }
    Item[] public items;

    function add(string calldata n, uint256 q) external { items.push(Item(n, q)); }
    function total() external view returns (uint256 t) {
        for (uint256 i = 0; i < items.length; i++) t += items[i].qty;
    }
}
