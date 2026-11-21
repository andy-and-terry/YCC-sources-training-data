// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
contract MunchausenNumbers {
    function isMunchausen(uint256 n) public pure returns (bool) {
        uint256 sum = 0;
        for (uint256 m = n; m > 0; m /= 10) {
            uint256 d = m % 10;
            if (d > 0) sum += d ** d;
        }
        return sum == n;
    }
}
