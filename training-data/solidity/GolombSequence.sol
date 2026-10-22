// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GolombSequence {
    // a(1) = 1, a(n) = 1 + a(n - a(a(n - 1)))
    // First 20 terms: 1 2 2 3 3 4 4 4 5 5 5 6 6 6 6 7 7 7 7 8
    function golomb() public pure returns (uint256[20] memory out) {
        uint256[21] memory a;
        a[1] = 1;
        for (uint256 n = 2; n <= 20; n++) {
            a[n] = 1 + a[n - a[a[n - 1]]];
        }
        for (uint256 i = 0; i < 20; i++) {
            out[i] = a[i + 1];
        }
    }
}
