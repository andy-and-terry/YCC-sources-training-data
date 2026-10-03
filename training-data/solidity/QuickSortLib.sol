// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library QuickSortLib {
    function sort(uint256[] memory arr) internal pure returns (uint256[] memory) {
        if (arr.length > 1) {
            quickSort(arr, int256(0), int256(arr.length - 1));
        }
        return arr;
    }

    function quickSort(uint256[] memory arr, int256 low, int256 high) private pure {
        if (low >= high) {
            return;
        }
        uint256 pivot = arr[uint256(low + (high - low) / 2)];
        int256 i = low;
        int256 j = high;
        while (i <= j) {
            while (arr[uint256(i)] < pivot) {
                i++;
            }
            while (arr[uint256(j)] > pivot) {
                j--;
            }
            if (i <= j) {
                (arr[uint256(i)], arr[uint256(j)]) = (arr[uint256(j)], arr[uint256(i)]);
                i++;
                j--;
            }
        }
        if (low < j) {
            quickSort(arr, low, j);
        }
        if (i < high) {
            quickSort(arr, i, high);
        }
    }
}
