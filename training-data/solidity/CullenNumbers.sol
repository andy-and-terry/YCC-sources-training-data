// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CullenNumbers {
    function cullen(uint256 n) public pure returns (uint256) {
        return n * (2 ** n) + 1;
    }

    function firstFive() public pure returns (uint256[5] memory out) {
        for (uint256 n = 1; n <= 5; n++) {
            out[n - 1] = cullen(n);
        }
    }
}
