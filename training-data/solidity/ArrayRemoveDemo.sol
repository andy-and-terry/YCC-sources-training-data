// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ArrayRemoveDemo {
    uint256[] public items;

    function add(uint256 value) external {
        items.push(value);
    }

    // Preserves order, O(n) gas
    function removeOrdered(uint256 index) external {
        require(index < items.length, "out of range");
        for (uint256 i = index; i < items.length - 1; i++) {
            items[i] = items[i + 1];
        }
        items.pop();
    }

    // Does not preserve order, O(1) gas
    function removeSwap(uint256 index) external {
        require(index < items.length, "out of range");
        items[index] = items[items.length - 1];
        items.pop();
    }

    function all() external view returns (uint256[] memory) {
        return items;
    }

    function length() external view returns (uint256) {
        return items.length;
    }

    function indexOf(uint256 value) external view returns (int256) {
        for (uint256 i = 0; i < items.length; i++) {
            if (items[i] == value) return int256(i);
        }
        return -1;
    }
}
