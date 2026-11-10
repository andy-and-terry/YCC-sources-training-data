// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract DelannoyNumbers {
    // centralDelannoy(0..5) => 1, 3, 13, 63, 321, 1683
    function centralDelannoy(uint256 n) external pure returns (uint256) {
        uint256[] memory prev = new uint256[](n + 1);
        uint256[] memory cur = new uint256[](n + 1);
        for (uint256 j = 0; j <= n; j++) prev[j] = 1;
        for (uint256 i = 1; i <= n; i++) {
            cur[0] = 1;
            for (uint256 j = 1; j <= n; j++) cur[j] = prev[j] + cur[j - 1] + prev[j - 1];
            (prev, cur) = (cur, prev);
        }
        return prev[n];
    }
}
