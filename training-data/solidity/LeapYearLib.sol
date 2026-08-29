// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library LeapYearLib {
    function isLeapYear(uint256 year) internal pure returns (bool) {
        return (year % 4 == 0 && year % 100 != 0) || year % 400 == 0;
    }
}
