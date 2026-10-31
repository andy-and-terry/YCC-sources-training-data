// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SphenicNumbers {
    function isSphenic(uint256 n) public pure returns (bool) {
        uint256 distinct = 0;
        for (uint256 p = 2; p * p <= n; p++) {
            if (n % p == 0) {
                n /= p;
                if (n % p == 0) return false;
                distinct++;
            }
        }
        if (n > 1) distinct++;
        return distinct == 3;
    }
}
