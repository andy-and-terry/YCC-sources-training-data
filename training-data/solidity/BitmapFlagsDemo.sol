// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BitmapFlagsDemo {
    uint8 public constant FLAG_READ = 1 << 0;
    uint8 public constant FLAG_WRITE = 1 << 1;
    uint8 public constant FLAG_ADMIN = 1 << 2;

    mapping(address => uint8) public permissions;

    // One storage bit per claim index, packed 256 to a word.
    mapping(uint256 => uint256) private claimedBitmap;

    function grant(address user, uint8 flags) external {
        permissions[user] |= flags;
    }

    function revoke(address user, uint8 flags) external {
        permissions[user] &= ~flags;
    }

    function has(address user, uint8 flag) public view returns (bool) {
        return permissions[user] & flag == flag;
    }

    function isClaimed(uint256 index) public view returns (bool) {
        uint256 word = index / 256;
        uint256 bit = index % 256;
        return claimedBitmap[word] & (1 << bit) != 0;
    }

    function setClaimed(uint256 index) external {
        require(!isClaimed(index), "already claimed");
        claimedBitmap[index / 256] |= (1 << (index % 256));
    }

    function popCount(uint256 x) external pure returns (uint256 count) {
        while (x != 0) {
            x &= x - 1;
            count++;
        }
    }
}
