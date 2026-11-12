// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract Items {
    struct Item { string name; uint price; }
    Item[] public items;
    function add(string calldata n, uint p) external { items.push(Item(n, p)); }
    function total() external view returns (uint t) { for (uint i; i < items.length; i++) t += items[i].price; }
}
