// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library MergeSortLib {
    function sort(uint256[] memory arr) internal pure returns (uint256[] memory) {
        if (arr.length <= 1) return arr;
        uint256 mid = arr.length / 2;

        uint256[] memory left = new uint256[](mid);
        uint256[] memory right = new uint256[](arr.length - mid);
        for (uint256 i = 0; i < mid; i++) left[i] = arr[i];
        for (uint256 i = mid; i < arr.length; i++) right[i - mid] = arr[i];

        left = sort(left);
        right = sort(right);
        return merge(left, right);
    }

    function merge(uint256[] memory left, uint256[] memory right) internal pure returns (uint256[] memory) {
        uint256[] memory result = new uint256[](left.length + right.length);
        uint256 i = 0;
        uint256 j = 0;
        uint256 k = 0;
        while (i < left.length && j < right.length) {
            if (left[i] <= right[j]) {
                result[k++] = left[i++];
            } else {
                result[k++] = right[j++];
            }
        }
        while (i < left.length) result[k++] = left[i++];
        while (j < right.length) result[k++] = right[j++];
        return result;
    }
}
