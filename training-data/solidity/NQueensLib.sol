// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library NQueensLib {
    function isSafe(uint256[] memory queens, uint256 count, uint256 col) internal pure returns (bool) {
        for (uint256 i = 0; i < count; i++) {
            uint256 dist = count - i;
            if (queens[i] == col) return false;
            if (queens[i] > col && queens[i] - col == dist) return false;
            if (col > queens[i] && col - queens[i] == dist) return false;
        }
        return true;
    }

    function solve(uint256[] memory queens, uint256 count, uint256 n) internal pure returns (uint256) {
        if (count == n) return 1;
        uint256 total = 0;
        for (uint256 col = 0; col < n; col++) {
            if (isSafe(queens, count, col)) {
                queens[count] = col;
                total += solve(queens, count + 1, n);
            }
        }
        return total;
    }
}
