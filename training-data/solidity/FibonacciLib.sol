// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library FibonacciLib {
    function fibonacci(uint256 n) internal pure returns (uint256) {
        if (n < 2) {
            return n;
        }
        uint256 a = 0;
        uint256 b = 1;
        for (uint256 i = 2; i <= n; i++) {
            uint256 temp = a + b;
            a = b;
            b = temp;
        }
        return b;
    }
}
