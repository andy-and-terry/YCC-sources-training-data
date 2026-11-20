// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract WilsonPrimeCheck {
    // Wilson's theorem: n is prime iff (n-1)! mod n == n-1.
    function wilson(uint256 n) public pure returns (bool) {
        if (n < 2) return false;
        uint256 f = 1;
        for (uint256 i = 2; i < n; i++) f = (f * i) % n;
        return f == n - 1;
    }
}
