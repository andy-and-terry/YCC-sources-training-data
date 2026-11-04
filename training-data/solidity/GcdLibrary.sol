// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

library GcdLib {
    function gcd(uint256 a, uint256 b) internal pure returns (uint256) {
        while (b != 0) {
            (a, b) = (b, a % b);
        }
        return a;
    }

    function gcdAll(uint256[] memory nums) internal pure returns (uint256 g) {
        for (uint256 i = 0; i < nums.length; i++) {
            g = gcd(g, nums[i]);
        }
    }
}

contract GcdDemo {
    function run() external pure returns (uint256) {
        uint256[] memory xs = new uint256[](3);
        xs[0] = 12; xs[1] = 18; xs[2] = 24;
        return GcdLib.gcdAll(xs);
    }
}
