// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FactorionCheck {
    function isFactorion(uint256 n) public pure returns (bool) {
        uint256[10] memory fact = [uint256(1), 1, 2, 6, 24, 120, 720, 5040, 40320, 362880];
        uint256 sum = 0;
        for (uint256 m = n; m > 0; m /= 10) {
            sum += fact[m % 10];
        }
        return sum == n;
    }
}
