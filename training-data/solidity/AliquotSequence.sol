// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AliquotSequence {
    function properSum(uint256 n) internal pure returns (uint256 sum) {
        for (uint256 d = 1; d <= n / 2; d++) {
            if (n % d == 0) sum += d;
        }
    }

    // Aliquot sequence of 12: 12 16 15 9 4 3 1 0
    function aliquot(uint256 start) public pure returns (uint256[] memory) {
        uint256[] memory buf = new uint256[](64);
        uint256 len = 0;
        uint256 n = start;
        buf[len++] = n;
        while (n != 0 && len < 64) {
            n = properSum(n);
            buf[len++] = n;
        }
        uint256[] memory out = new uint256[](len);
        for (uint256 i = 0; i < len; i++) {
            out[i] = buf[i];
        }
        return out;
    }
}
