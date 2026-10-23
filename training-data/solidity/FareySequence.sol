// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FareySequence {
    function termCount(uint256 n) internal pure returns (uint256 count) {
        uint256 a = 0;
        uint256 b = 1;
        uint256 c = 1;
        uint256 d = n;
        count = 1;
        while (!(a == 1 && b == 1)) {
            uint256 k = (n + b) / d;
            (a, b, c, d) = (c, d, k * c - a, k * d - b);
            count++;
        }
    }

    // Returns numerators and denominators of the Farey sequence F_n.
    function farey(uint256 n) public pure returns (uint256[] memory nums, uint256[] memory dens) {
        uint256 count = termCount(n);
        nums = new uint256[](count);
        dens = new uint256[](count);
        uint256 a = 0;
        uint256 b = 1;
        uint256 c = 1;
        uint256 d = n;
        for (uint256 i = 0; i < count; i++) {
            nums[i] = a;
            dens[i] = b;
            uint256 k = (n + b) / d;
            (a, b, c, d) = (c, d, k * c - a, k * d - b);
        }
    }
}
