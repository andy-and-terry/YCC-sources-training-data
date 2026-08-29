// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library PalindromeCheckLib {
    function isPalindrome(string memory str) internal pure returns (bool) {
        bytes memory b = bytes(str);
        uint256 n = b.length;
        for (uint256 i = 0; i < n / 2; i++) {
            if (b[i] != b[n - 1 - i]) {
                return false;
            }
        }
        return true;
    }
}
