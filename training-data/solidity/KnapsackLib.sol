// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library KnapsackLib {
    function solve(uint256[] memory weights, uint256[] memory values, uint256 capacity) internal pure returns (uint256) {
        uint256[] memory dp = new uint256[](capacity + 1);
        for (uint256 i = 0; i < weights.length; i++) {
            for (uint256 cap = capacity; cap >= weights[i]; cap--) {
                uint256 withItem = dp[cap - weights[i]] + values[i];
                if (withItem > dp[cap]) {
                    dp[cap] = withItem;
                }
                if (cap == 0) break;
            }
        }
        return dp[capacity];
    }
}
