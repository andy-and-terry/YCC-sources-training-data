// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract JaccardSimilarity {
    // sets are bitmasks over elements 0..255; result scaled by 1e4
    function jaccard(uint256 a, uint256 b) external pure returns (uint256) {
        uint256 union_ = _popcount(a | b);
        if (union_ == 0) return 10_000;
        return (_popcount(a & b) * 10_000) / union_;
    }

    function _popcount(uint256 n) private pure returns (uint256 c) {
        while (n != 0) {
            n &= n - 1;
            c++;
        }
    }
}
