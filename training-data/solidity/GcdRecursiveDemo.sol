// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GcdRecursiveDemo {
    function gcdRecursive(uint256 a, uint256 b) public pure returns (uint256) {
        if (b == 0) return a;
        return gcdRecursive(b, a % b);
    }
}
