// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PowerfulNumbers {
    function isPowerful(uint256 n) public pure returns (bool) {
        for (uint256 p = 2; p * p <= n; p++) {
            if (n % p == 0) {
                if (n % (p * p) != 0) return false;
                while (n % p == 0) {
                    n /= p;
                }
            }
        }
        return n == 1;
    }
}
