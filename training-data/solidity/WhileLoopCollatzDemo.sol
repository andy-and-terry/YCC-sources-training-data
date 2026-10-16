// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract WhileLoopCollatzDemo {
    function steps(uint256 n) external pure returns (uint256 count) {
        require(n > 0, "n must be positive");
        while (n != 1) {
            n = n % 2 == 0 ? n / 2 : 3 * n + 1;
            count++;
        }
    }

    function doWhileSum(uint256 n) external pure returns (uint256 total) {
        uint256 i = 0;
        do {
            total += i;
            i++;
        } while (i <= n);
    }
}
