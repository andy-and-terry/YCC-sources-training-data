// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ShoelaceArea {
    function area2(int[] memory x, int[] memory y) public pure returns (uint) {
        int s = 0;
        uint n = x.length;
        for (uint i = 0; i < n; i++) {
            uint j = (i + 1) % n;
            s += x[i] * y[j] - x[j] * y[i];
        }
        return uint(s < 0 ? -s : s); // twice the area
    }
}
