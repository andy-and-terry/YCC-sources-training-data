// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Bouncy numbers: digits are neither non-decreasing nor non-increasing.
contract BouncyNumbers {
    function isBouncy(uint256 n) public pure returns (bool) {
        bool inc = true;
        bool dec = true;
        uint256 prev = n % 10;
        for (uint256 m = n / 10; m > 0; m /= 10) {
            uint256 d = m % 10;
            if (d > prev) inc = false;
            if (d < prev) dec = false;
            prev = d;
        }
        return !inc && !dec;
    }

    // countBouncy(1000) == 525 (counts 1 .. limit-1)
    function countBouncy(uint256 limit) public pure returns (uint256 count) {
        for (uint256 n = 1; n < limit; n++) {
            if (isBouncy(n)) count++;
        }
    }
}
