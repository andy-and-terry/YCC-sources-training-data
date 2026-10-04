// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// Packs up to 256 boolean flags per user in a single uint256.
contract BitmapFlagsDemo {
    mapping(address => uint256) private flags;

    event FlagSet(address indexed user, uint8 index, bool value);

    function setFlag(uint8 index, bool value) external {
        if (value) {
            flags[msg.sender] |= (1 << index);
        } else {
            flags[msg.sender] &= ~(1 << index);
        }
        emit FlagSet(msg.sender, index, value);
    }

    function hasFlag(address user, uint8 index) external view returns (bool) {
        return (flags[user] >> index) & 1 == 1;
    }

    function countFlags(address user) external view returns (uint256 count) {
        uint256 v = flags[user];
        while (v != 0) {
            v &= v - 1;
            count++;
        }
    }
}
