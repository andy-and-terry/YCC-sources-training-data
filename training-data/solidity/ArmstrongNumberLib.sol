// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library ArmstrongNumberLib {
    function isArmstrong(uint256 n) internal pure returns (bool) {
        uint256 numDigits = 0;
        uint256 temp = n;
        while (temp > 0) {
            numDigits++;
            temp /= 10;
        }
        uint256 total = 0;
        temp = n;
        while (temp > 0) {
            uint256 digit = temp % 10;
            uint256 power = 1;
            for (uint256 i = 0; i < numDigits; i++) {
                power *= digit;
            }
            total += power;
            temp /= 10;
        }
        return total == n;
    }
}
