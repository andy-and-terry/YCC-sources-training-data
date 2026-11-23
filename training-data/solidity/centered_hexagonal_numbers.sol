// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// 3n(n-1)+1
contract CenteredHexagonalNumbers {
    function term(uint256 n) public pure returns (uint256) {
        return ((3 * n) * (n - 1)) + 1;
    }

    function firstFifteen() public pure returns (uint256[15] memory out) {
        for (uint256 n = 1; n <= 15; n++) {
            out[n - 1] = term(n);
        }
    }
}
