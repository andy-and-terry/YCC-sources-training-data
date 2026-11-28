// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract ArmstrongNumbers {
    function digitCount(uint256 n) internal pure returns (uint256 len) {
        while (n > 0) {
            len++;
            n /= 10;
        }
    }

    function isArmstrong(uint256 n) public pure returns (bool) {
        uint256 len = digitCount(n);
        uint256 total;
        for (uint256 m = n; m > 0; m /= 10) {
            total += (m % 10) ** len;
        }
        return total == n;
    }

    function check() external pure returns (bool, bool) {
        return (isArmstrong(153), isArmstrong(154)); // (true, false)
    }
}
