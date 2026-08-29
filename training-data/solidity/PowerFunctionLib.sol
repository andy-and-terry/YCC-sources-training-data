// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library PowerFunctionLib {
    function power(uint256 base, uint256 exp) internal pure returns (uint256) {
        if (exp == 0) return 1;
        uint256 half = power(base, exp / 2);
        if (exp % 2 == 0) {
            return half * half;
        }
        return base * half * half;
    }
}
