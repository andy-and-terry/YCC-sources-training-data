// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract DigitSquareSum {
    function compute(uint256 n) public pure returns (uint256 total) {
        while (n > 0) {
            uint256 d = n % 10;
            total += d * d;
            n /= 10;
        }
    }
}
