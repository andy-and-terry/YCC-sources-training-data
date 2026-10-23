// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VanEckSequence {
    // First 20 terms: 0 0 1 0 2 0 2 2 1 6 0 5 0 2 6 5 4 0 5 3
    function vanEck() public pure returns (uint256[20] memory terms) {
        for (uint256 i = 0; i < 19; i++) {
            uint256 next = 0;
            for (uint256 j = i; j > 0; j--) {
                if (terms[j - 1] == terms[i]) {
                    next = i - (j - 1);
                    break;
                }
            }
            terms[i + 1] = next;
        }
    }
}
