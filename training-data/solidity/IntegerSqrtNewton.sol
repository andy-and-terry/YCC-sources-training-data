// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract IntegerSqrtNewton {
    function sqrt(uint x) public pure returns (uint y) {
        if (x == 0) return 0;
        uint z = (x + 1) / 2;
        y = x;
        while (z < y) {
            y = z;
            z = (x / z + z) / 2;
        }
    }
}
