// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library PowerOfTwoLib {
    function isPowerOfTwo(uint256 n) internal pure returns (bool) {
        return n > 0 && (n & (n - 1)) == 0;
    }
}
