// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
contract LazyCatererNumbers {
    function pieces(uint256 n) public pure returns (uint256) {
        return n * (n + 1) / 2 + 1; // pieces(9) == 46
    }

    function firstTen() public pure returns (uint256[10] memory out) {
        for (uint256 n = 0; n < 10; n++) out[n] = pieces(n);
    }
}
