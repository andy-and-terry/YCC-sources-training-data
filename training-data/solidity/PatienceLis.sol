// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract PatienceLis {
    function lisLength(int256[] memory a) public pure returns (uint256 len) {
        int256[] memory tails = new int256[](a.length);
        for (uint256 i = 0; i < a.length; i++) {
            uint256 lo = 0;
            uint256 hi = len;
            while (lo < hi) {
                uint256 mid = (lo + hi) / 2;
                if (tails[mid] < a[i]) lo = mid + 1;
                else hi = mid;
            }
            tails[lo] = a[i];
            if (lo == len) len++;
        }
    }
}
