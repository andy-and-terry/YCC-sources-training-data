// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Greedy sequence whose pairwise sums are all distinct.
contract MianChowlaSequence {
    function firstEight() external pure returns (uint256[8] memory seq) {
        bool[256] memory used;
        uint256 n;
        for (uint256 cand = 1; n < 8; cand++) {
            bool[256] memory fresh;
            bool ok = true;
            seq[n] = cand;
            for (uint256 i = 0; i <= n; i++) {
                uint256 s = seq[i] + cand;
                if (used[s] || fresh[s]) {
                    ok = false;
                    break;
                }
                fresh[s] = true;
            }
            if (ok) {
                for (uint256 s = 0; s < 256; s++) {
                    if (fresh[s]) used[s] = true;
                }
                n++;
            }
        }
    }
}
