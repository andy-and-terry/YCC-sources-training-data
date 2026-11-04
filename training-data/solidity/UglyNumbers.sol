// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract UglyNumbers {
    function ugly(uint256 n) public pure returns (uint256) {
        uint256[] memory seq = new uint256[](n);
        seq[0] = 1;
        uint256 i2; uint256 i3; uint256 i5;
        for (uint256 k = 1; k < n; k++) {
            uint256 c2 = seq[i2] * 2;
            uint256 c3 = seq[i3] * 3;
            uint256 c5 = seq[i5] * 5;
            uint256 next = c2 < c3 ? (c2 < c5 ? c2 : c5) : (c3 < c5 ? c3 : c5);
            seq[k] = next;
            if (next == c2) i2++;
            if (next == c3) i3++;
            if (next == c5) i5++;
        }
        return seq[n - 1];
    }
}
