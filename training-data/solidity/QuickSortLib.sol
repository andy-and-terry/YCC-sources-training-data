// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library QuickSortLib {
    function sort(uint256[] memory data) internal pure returns (uint256[] memory) {
        if (data.length > 1) {
            _quickSort(data, 0, int256(data.length - 1));
        }
        return data;
    }

    function _quickSort(uint256[] memory arr, int256 low, int256 high) private pure {
        int256 i = low;
        int256 j = high;
        if (i == j) return;
        uint256 pivot = arr[uint256(low + (high - low) / 2)];
        while (i <= j) {
            while (arr[uint256(i)] < pivot) i++;
            while (pivot < arr[uint256(j)]) j--;
            if (i <= j) {
                (arr[uint256(i)], arr[uint256(j)]) = (arr[uint256(j)], arr[uint256(i)]);
                i++;
                j--;
            }
        }
        if (low < j) _quickSort(arr, low, j);
        if (i < high) _quickSort(arr, i, high);
    }
}

contract QuickSortDemo {
    using QuickSortLib for uint256[];

    function sorted(uint256[] memory values) external pure returns (uint256[] memory) {
        return values.sort();
    }
}
