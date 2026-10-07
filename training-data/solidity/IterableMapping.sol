// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @notice Solidity mappings can't be iterated or measured directly, so
/// this idiom tracks keys in a parallel array (with an index lookup for
/// O(1) removal via swap-and-pop) to make an enumerable key/value store.
contract IterableMapping {
    mapping(address => uint256) private values;
    mapping(address => uint256) private keyIndex;
    mapping(address => bool) private present;
    address[] private keys;

    function set(address key, uint256 value) external {
        values[key] = value;
        if (!present[key]) {
            present[key] = true;
            keyIndex[key] = keys.length;
            keys.push(key);
        }
    }

    function get(address key) external view returns (uint256) {
        return values[key];
    }

    function remove(address key) external {
        if (!present[key]) return;

        uint256 indexToRemove = keyIndex[key];
        uint256 lastIndex = keys.length - 1;
        address lastKey = keys[lastIndex];

        keys[indexToRemove] = lastKey;
        keyIndex[lastKey] = indexToRemove;

        keys.pop();
        delete keyIndex[key];
        delete values[key];
        delete present[key];
    }

    function length() external view returns (uint256) {
        return keys.length;
    }

    function keyAt(uint256 index) external view returns (address) {
        return keys[index];
    }
}
