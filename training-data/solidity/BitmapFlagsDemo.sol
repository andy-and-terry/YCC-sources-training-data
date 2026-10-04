// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BitmapFlagsDemo {
    uint8 public constant READ = 1 << 0;
    uint8 public constant WRITE = 1 << 1;
    uint8 public constant EXECUTE = 1 << 2;
    uint8 public constant ADMIN = 1 << 3;

    mapping(address => uint8) public permissions;

    function grant(address user, uint8 flags) external {
        permissions[user] |= flags;
    }

    function revoke(address user, uint8 flags) external {
        permissions[user] &= ~flags;
    }

    function toggle(address user, uint8 flags) external {
        permissions[user] ^= flags;
    }

    function has(address user, uint8 flag) public view returns (bool) {
        return permissions[user] & flag != 0;
    }

    function hasAll(address user, uint8 flags) external view returns (bool) {
        return permissions[user] & flags == flags;
    }

    function countFlags(address user) external view returns (uint256 count) {
        uint8 p = permissions[user];
        while (p != 0) {
            count += p & 1;
            p >>= 1;
        }
    }
}
