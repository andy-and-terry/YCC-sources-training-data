// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library BitmapLib {
    function isSet(uint256 bitmap, uint8 index) internal pure returns (bool) {
        return (bitmap >> index) & 1 == 1;
    }

    function set(uint256 bitmap, uint8 index) internal pure returns (uint256) {
        return bitmap | (uint256(1) << index);
    }

    function clear(uint256 bitmap, uint8 index) internal pure returns (uint256) {
        return bitmap & ~(uint256(1) << index);
    }

    function popCount(uint256 bitmap) internal pure returns (uint256 count) {
        while (bitmap != 0) {
            bitmap &= bitmap - 1;
            count++;
        }
    }
}

contract BitmapLibDemo {
    using BitmapLib for uint256;

    uint256 public flags;

    function setFlag(uint8 index) external {
        flags = flags.set(index);
    }

    function clearFlag(uint8 index) external {
        flags = flags.clear(index);
    }

    function hasFlag(uint8 index) external view returns (bool) {
        return flags.isSet(index);
    }

    function totalFlags() external view returns (uint256) {
        return flags.popCount();
    }
}
