// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// Deficient numbers below 100; expect 76.
contract DeficientNumbers {
    function properSum(uint256 n) internal pure returns (uint256 t) {
        for (uint256 d = 1; d < n; d++) {
            if (n % d == 0) t += d;
        }
    }

    function count() external pure returns (uint256 c) {
        for (uint256 n = 1; n < 100; n++) {
            if (properSum(n) < n) c++;
        }
    }
}
