// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract LahNumbers {
    function lah(uint256 n, uint256 k) public pure returns (uint256) {
        uint256 c = 1;
        uint256 f = 1;
        for (uint256 i = 0; i + 1 < k; i++) c = (c * (n - 1 - i)) / (i + 1);
        for (uint256 i = k + 1; i <= n; i++) f *= i;
        return c * f;
    }
}
