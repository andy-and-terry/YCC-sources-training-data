// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MultiplicativePersistence {
    function persistence(uint256 n) public pure returns (uint256 steps) {
        while (n >= 10) {
            uint256 product = 1;
            while (n > 0) {
                product *= n % 10;
                n /= 10;
            }
            n = product;
            steps++;
        }
    }
}
