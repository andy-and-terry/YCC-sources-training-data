// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library MedianLib {
    function median(uint256[] memory values) internal pure returns (uint256) {
        uint256 n = values.length;
        require(n > 0, "empty");
        // Insertion sort on a memory copy is fine for small oracle sets.
        for (uint256 i = 1; i < n; i++) {
            uint256 key = values[i];
            uint256 j = i;
            while (j > 0 && values[j - 1] > key) {
                values[j] = values[j - 1];
                j--;
            }
            values[j] = key;
        }
        if (n % 2 == 1) return values[n / 2];
        return (values[n / 2 - 1] + values[n / 2]) / 2;
    }
}

contract MedianDemo {
    function medianOf(uint256[] memory values) external pure returns (uint256) {
        return MedianLib.median(values);
    }
}
