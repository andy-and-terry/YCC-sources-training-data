// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Reverse-and-add until a palindrome; count the steps.
contract LychrelSteps {
    function reverseDigits(uint256 n) public pure returns (uint256 r) {
        while (n > 0) {
            r = r * 10 + n % 10;
            n /= 10;
        }
    }

    // Returns the step count, or -1 if no palindrome within 50 steps.
    function steps(uint256 start) public pure returns (int256) {
        uint256 n = start;
        for (uint256 count = 0; count < 50; count++) {
            if (count > 0 && n == reverseDigits(n)) return int256(count);
            n += reverseDigits(n);
        }
        return -1;
    }
}
