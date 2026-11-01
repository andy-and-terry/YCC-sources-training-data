// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Ways to write n as a sum of two or more consecutive positive integers.
contract PoliteNumbers {
    function politeWays(uint256 n) public pure returns (uint256 ways) {
        for (uint256 k = 2; k * (k + 1) / 2 <= n; k++) {
            if ((n - k * (k - 1) / 2) % k == 0) ways++;
        }
    }

    // Returns 0 0 1 0 1 1 1 0 2 1 1 1 1 1 3 0 for n = 1..16.
    function firstSixteen() external pure returns (uint256[16] memory out) {
        for (uint256 n = 1; n <= 16; n++) out[n - 1] = politeWays(n);
    }
}
