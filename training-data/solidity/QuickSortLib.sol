// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library QuickSortLib {
    function sort(uint256[] memory arr) internal pure returns (uint256[] memory) {
        if (arr.length > 1) {
            quickSort(arr, 0, int256(arr.length - 1));
        }
        return arr;
    }

    function quickSort(uint256[] memory arr, int256 left, int256 right) private pure {
        if (left >= right) return;
        uint256 pivot = arr[uint256(left + (right - left) / 2)];
        int256 i = left;
        int256 j = right;
        while (i <= j) {
            while (arr[uint256(i)] < pivot) i++;
            while (arr[uint256(j)] > pivot) j--;
            if (i <= j) {
                (arr[uint256(i)], arr[uint256(j)]) = (arr[uint256(j)], arr[uint256(i)]);
                i++;
                j--;
            }
        }
        if (left < j) quickSort(arr, left, j);
        if (i < right) quickSort(arr, i, right);
    }
}
