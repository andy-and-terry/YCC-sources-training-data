// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract DeficientNumbers {
    function sigma(uint256 n) public pure returns (uint256 s) {
        for (uint256 d = 1; d <= n; d++) {
            if (n % d == 0) s += d;
        }
    }

    function isDeficient(uint256 n) external pure returns (bool) {
        return n > 0 && sigma(n) < 2 * n;
    }
}
