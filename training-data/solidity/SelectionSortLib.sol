// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library SelectionSortLib {
    function sort(uint256[] memory arr) internal pure returns (uint256[] memory) {
        for (uint256 i = 0; i < arr.length - 1; i++) {
            uint256 minIdx = i;
            for (uint256 j = i + 1; j < arr.length; j++) {
                if (arr[j] < arr[minIdx]) {
                    minIdx = j;
                }
            }
            (arr[i], arr[minIdx]) = (arr[minIdx], arr[i]);
        }
        return arr;
    }
}
