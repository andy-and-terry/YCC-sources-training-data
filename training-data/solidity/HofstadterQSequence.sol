// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HofstadterQSequence {
    // Q(1) = Q(2) = 1, Q(n) = Q(n - Q(n - 1)) + Q(n - Q(n - 2))
    // First 20 terms: 1 1 2 3 3 4 5 5 6 6 6 8 8 8 10 9 10 11 11 12
    function hofstadterQ() public pure returns (uint256[20] memory out) {
        uint256[21] memory q;
        q[1] = 1;
        q[2] = 1;
        for (uint256 n = 3; n <= 20; n++) {
            q[n] = q[n - q[n - 1]] + q[n - q[n - 2]];
        }
        for (uint256 i = 0; i < 20; i++) {
            out[i] = q[i + 1];
        }
    }
}
