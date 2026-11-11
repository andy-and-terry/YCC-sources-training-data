// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Narayana's cows N(n)=N(n-1)+N(n-3)
contract NarayanaCows {
    function firstTen() public pure returns (uint256[10] memory v) {
        v[0] = 1;
        v[1] = 1;
        v[2] = 1;
        for (uint256 i = 3; i < 10; i++) {
            v[i] = v[i - 1] + v[i - 3];
        }
    }
}
