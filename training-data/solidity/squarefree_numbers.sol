// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// Squarefree numbers up to 100; expect 61.
contract SquarefreeNumbers {
    function squarefree(uint256 n) internal pure returns (bool) {
        for (uint256 d = 2; d * d <= n; d++) {
            if (n % (d * d) == 0) return false;
        }
        return true;
    }

    function count() external pure returns (uint256 c) {
        for (uint256 n = 1; n <= 100; n++) {
            if (squarefree(n)) c++;
        }
    }
}
