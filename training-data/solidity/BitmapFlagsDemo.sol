// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BitmapFlagsDemo {
    uint256 private constant FLAG_READ = 1 << 0;
    uint256 private constant FLAG_WRITE = 1 << 1;
    uint256 private constant FLAG_ADMIN = 1 << 2;

    mapping(address => uint256) public permissions;

    function grant(address user, uint256 flags) external {
        permissions[user] |= flags;
    }

    function revoke(address user, uint256 flags) external {
        permissions[user] &= ~flags;
    }

    function has(address user, uint256 flag) public view returns (bool) {
        return permissions[user] & flag != 0;
    }

    function canWrite(address user) external view returns (bool) {
        return has(user, FLAG_WRITE);
    }

    function flags() external pure returns (uint256, uint256, uint256) {
        return (FLAG_READ, FLAG_WRITE, FLAG_ADMIN);
    }
}
