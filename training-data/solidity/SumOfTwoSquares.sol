// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Positive n expressible as a*a + b*b with a, b >= 0.
contract SumOfTwoSquares {
    function representable(uint256 n) public pure returns (bool) {
        for (uint256 a = 0; a * a <= n; a++) {
            for (uint256 b = a; a * a + b * b <= n; b++) {
                if (a * a + b * b == n) return true;
            }
        }
        return false;
    }

    function countUpTo(uint256 limit) external pure returns (uint256 count) {
        for (uint256 n = 1; n <= limit; n++) {
            if (representable(n)) count++;
        }
    }
}
