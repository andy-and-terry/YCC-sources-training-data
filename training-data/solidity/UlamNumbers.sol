// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UlamNumbers {
    // First 15 terms: 1 2 3 4 6 8 11 13 16 18 26 28 36 38 47
    function ulam() public pure returns (uint256[15] memory terms) {
        terms[0] = 1;
        terms[1] = 2;
        uint256 len = 2;
        uint256 candidate = 3;
        while (len < 15) {
            uint256 ways = 0;
            for (uint256 i = 0; i < len; i++) {
                for (uint256 j = i + 1; j < len; j++) {
                    if (terms[i] + terms[j] == candidate) ways++;
                }
            }
            if (ways == 1) {
                terms[len] = candidate;
                len++;
            }
            candidate++;
        }
    }
}
