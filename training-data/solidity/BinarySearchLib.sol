// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library BinarySearchLib {
    function search(uint256[] memory arr, uint256 target) internal pure returns (int256) {
        int256 low = 0;
        int256 high = int256(arr.length) - 1;
        while (low <= high) {
            int256 mid = (low + high) / 2;
            uint256 value = arr[uint256(mid)];
            if (value == target) {
                return mid;
            } else if (value < target) {
                low = mid + 1;
            } else {
                high = mid - 1;
            }
        }
        return -1;
    }
}
