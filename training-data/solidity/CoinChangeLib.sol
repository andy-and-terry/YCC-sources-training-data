// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library CoinChangeLib {
    uint256 private constant UNREACHABLE = type(uint256).max;

    function minCoins(uint256[] memory coins, uint256 amount) internal pure returns (uint256) {
        uint256[] memory dp = new uint256[](amount + 1);
        dp[0] = 0;
        for (uint256 a = 1; a <= amount; a++) {
            dp[a] = UNREACHABLE;
            for (uint256 i = 0; i < coins.length; i++) {
                if (coins[i] <= a && dp[a - coins[i]] != UNREACHABLE) {
                    uint256 candidate = dp[a - coins[i]] + 1;
                    if (candidate < dp[a]) {
                        dp[a] = candidate;
                    }
                }
            }
        }
        return dp[amount];
    }
}
