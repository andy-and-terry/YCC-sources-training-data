// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract KolakoskiSequence {
    // First 20 terms: 1 2 2 1 1 2 1 2 2 1 2 2 1 1 2 1 1 2 2 1
    function kolakoski() public pure returns (uint256[20] memory terms) {
        terms[0] = 1;
        terms[1] = 2;
        terms[2] = 2;
        uint256 len = 3;
        uint256 i = 2;
        while (len < 20) {
            uint256 value = 3 - terms[len - 1];
            for (uint256 j = 0; j < terms[i] && len < 20; j++) {
                terms[len] = value;
                len++;
            }
            i++;
        }
    }
}
