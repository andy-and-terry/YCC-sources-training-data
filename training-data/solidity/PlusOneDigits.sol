// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract PlusOneDigits {
    function plusOne(uint8[] memory digits) public pure returns (uint8[] memory) {
        for (uint256 i = digits.length; i > 0; i--) {
            if (digits[i - 1] < 9) {
                digits[i - 1]++;
                return digits;
            }
            digits[i - 1] = 0;
        }
        uint8[] memory grown = new uint8[](digits.length + 1);
        grown[0] = 1;
        return grown;
    }
}
