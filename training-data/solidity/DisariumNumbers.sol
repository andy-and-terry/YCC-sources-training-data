// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Disarium numbers: digits raised to their 1-based positions sum to n.
contract DisariumNumbers {
    function isDisarium(uint256 n) public pure returns (bool) {
        uint256 k = 0;
        for (uint256 m = n; m > 0; m /= 10) k++;
        uint256 sum = 0;
        uint256 m2 = n;
        for (uint256 pos = k; pos > 0; pos--) {
            sum += (m2 % 10) ** pos;
            m2 /= 10;
        }
        return sum == n;
    }
}
