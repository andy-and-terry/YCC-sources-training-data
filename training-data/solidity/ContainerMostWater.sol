// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract ContainerMostWater {
    function maxArea(uint256[] memory h) public pure returns (uint256 best) {
        uint256 lo = 0;
        uint256 hi = h.length - 1;
        while (lo < hi) {
            uint256 m = h[lo] < h[hi] ? h[lo] : h[hi];
            uint256 area = m * (hi - lo);
            if (area > best) best = area;
            if (h[lo] < h[hi]) lo++;
            else hi--;
        }
    }
}
