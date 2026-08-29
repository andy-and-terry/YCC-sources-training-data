// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library FibonacciIterativeLib {
    function fib(uint256 n) internal pure returns (uint256) {
        if (n < 2) return n;
        uint256 a = 0;
        uint256 b = 1;
        for (uint256 i = 2; i <= n; i++) {
            (a, b) = (b, a + b);
        }
        return b;
    }
}
