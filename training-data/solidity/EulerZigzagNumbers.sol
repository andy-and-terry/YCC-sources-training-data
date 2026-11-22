// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Euler zigzag numbers via the Seidel-Entringer boustrophedon.
contract EulerZigzagNumbers {
    // zigzag(9) == 7936; first ten: 1 1 1 2 5 16 61 272 1385 7936
    function zigzag(uint256 n) public pure returns (uint256) {
        uint256[] memory row = new uint256[](n + 1);
        uint256[] memory next = new uint256[](n + 1);
        row[0] = 1;
        uint256 len = 1;
        for (uint256 i = 0; i < n; i++) {
            next[0] = 0;
            for (uint256 j = 1; j <= len; j++) {
                next[j] = next[j - 1] + row[len - j];
            }
            len++;
            for (uint256 j = 0; j < len; j++) row[j] = next[j];
        }
        return row[len - 1];
    }
}
