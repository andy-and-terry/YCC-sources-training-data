// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SternDiatomicSequence {
    // First 20 terms: 0 1 1 2 1 3 2 3 1 4 3 5 2 5 3 4 1 5 4 7
    function stern() public pure returns (uint256[20] memory terms) {
        terms[1] = 1;
        for (uint256 n = 2; n < 20; n++) {
            if (n % 2 == 0) {
                terms[n] = terms[n / 2];
            } else {
                terms[n] = terms[n / 2] + terms[n / 2 + 1];
            }
        }
    }
}
