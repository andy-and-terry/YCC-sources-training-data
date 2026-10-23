// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)
contract TribonacciNumbers {
    function tribonacci(uint256 count) external pure returns (uint256[] memory t) {
        t = new uint256[](count);
        if (count > 2) t[2] = 1;
        for (uint256 i = 3; i < count; i++) {
            t[i] = t[i - 1] + t[i - 2] + t[i - 3];
        }
    }
}
