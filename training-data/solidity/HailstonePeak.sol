// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// Highest value reached by the Collatz (hailstone) sequence from n.
contract HailstonePeak {
    function peak(uint256 n) external pure returns (uint256 best) {
        require(n > 0, "n must be positive");
        best = n;
        while (n != 1) {
            n = n % 2 == 0 ? n / 2 : 3 * n + 1;
            if (n > best) best = n;
        }
    }
}
