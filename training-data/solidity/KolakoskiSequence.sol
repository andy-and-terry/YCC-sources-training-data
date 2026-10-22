// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract KolakoskiSequence {
    // First 20 terms: 1 2 2 1 1 2 1 2 2 1 2 2 1 1 2 1 1 2 2 1
    function kolakoski() public pure returns (uint8[20] memory terms) {
        uint8[23] memory a;
        a[0] = 1;
        a[1] = 2;
        a[2] = 2;
        uint256 w = 3;
        uint8 v = 1;
        for (uint256 r = 2; w < 20; r++) {
            for (uint8 k = 0; k < a[r]; k++) {
                a[w++] = v;
            }
            v = 3 - v;
        }
        for (uint256 i = 0; i < 20; i++) {
            terms[i] = a[i];
        }
    }
}
