// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library DigitSumLib {
    function digitSum(uint256 n) internal pure returns (uint256) {
        uint256 total = 0;
        while (n > 0) {
            total += n % 10;
            n /= 10;
        }
        return total;
    }
}
