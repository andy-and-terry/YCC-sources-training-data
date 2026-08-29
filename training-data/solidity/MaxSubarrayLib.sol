// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library MaxSubarrayLib {
    function kadane(int256[] memory arr) internal pure returns (int256) {
        int256 best = arr[0];
        int256 current = arr[0];
        for (uint256 i = 1; i < arr.length; i++) {
            current = arr[i] > current + arr[i] ? arr[i] : current + arr[i];
            if (current > best) best = current;
        }
        return best;
    }
}
