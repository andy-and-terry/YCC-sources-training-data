// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ToeplitzCheck {
    function isToeplitz(int256[][] calldata m) external pure returns (bool) {
        for (uint256 i = 1; i < m.length; i++) {
            for (uint256 j = 1; j < m[i].length; j++) {
                if (m[i][j] != m[i - 1][j - 1]) return false;
            }
        }
        return true;
    }
}
