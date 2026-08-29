// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library InsertionSortLib {
    function sort(uint256[] memory arr) internal pure returns (uint256[] memory) {
        for (uint256 i = 1; i < arr.length; i++) {
            uint256 key = arr[i];
            int256 j = int256(i) - 1;
            while (j >= 0 && arr[uint256(j)] > key) {
                arr[uint256(j) + 1] = arr[uint256(j)];
                j--;
            }
            arr[uint256(j) + 1] = key;
        }
        return arr;
    }
}
