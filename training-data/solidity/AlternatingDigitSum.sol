// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AlternatingDigitSum {
    function alternatingDigitSum(uint256 n) public pure returns (int256 total) {
        int256 sign = 1;
        while (n > 0) {
            total += sign * int256(n % 10);
            sign = -sign;
            n /= 10;
        }
    }
}
