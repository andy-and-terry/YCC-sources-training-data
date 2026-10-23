// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RecamanSequence {
    function seen(uint256[20] memory terms, uint256 len, uint256 value) internal pure returns (bool) {
        for (uint256 i = 0; i < len; i++) {
            if (terms[i] == value) return true;
        }
        return false;
    }

    // First 20 terms: 0 1 3 6 2 7 13 20 12 21 11 22 10 23 9 24 8 25 43 62
    function recaman() public pure returns (uint256[20] memory terms) {
        terms[0] = 0;
        for (uint256 i = 1; i < 20; i++) {
            uint256 prev = terms[i - 1];
            uint256 next = prev + i;
            if (prev > i && !seen(terms, i, prev - i)) {
                next = prev - i;
            }
            terms[i] = next;
        }
    }
}
