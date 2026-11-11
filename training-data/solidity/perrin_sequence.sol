// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Perrin sequence P(n)=P(n-2)+P(n-3)
contract PerrinSequence {
    function firstTen() public pure returns (uint256[10] memory v) {
        v[0] = 3;
        v[1] = 0;
        v[2] = 2;
        for (uint256 i = 3; i < 10; i++) {
            v[i] = v[i - 2] + v[i - 3];
        }
    }
}
