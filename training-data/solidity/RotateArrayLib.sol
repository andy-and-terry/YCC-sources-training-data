// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library RotateArrayLib {
    function rotateLeft(uint256[] memory arr, uint256 k) internal pure returns (uint256[] memory out) {
        uint256 n = arr.length;
        out = new uint256[](n);
        if (n == 0) return out;
        k %= n;
        for (uint256 i = 0; i < n; i++) {
            out[i] = arr[(i + k) % n];
        }
    }
}

contract RotateArrayDemo {
    function rotate(uint256[] calldata arr, uint256 k) external pure returns (uint256[] memory) {
        return RotateArrayLib.rotateLeft(arr, k);
    }
}
