// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract TriangleMinPath {
    function minimumTotal(uint256[][] memory t) public pure returns (uint256) {
        uint256 n = t.length;
        uint256[] memory dp = new uint256[](n);
        for (uint256 i = 0; i < n; i++) dp[i] = t[n - 1][i];
        for (uint256 r = n - 1; r > 0; r--) {
            for (uint256 i = 0; i < r; i++) {
                uint256 m = dp[i] < dp[i + 1] ? dp[i] : dp[i + 1];
                dp[i] = t[r - 1][i] + m;
            }
        }
        return dp[0];
    }
}
