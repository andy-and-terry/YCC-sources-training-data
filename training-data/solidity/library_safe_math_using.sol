// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

library MathLib {
    function avg(uint256 a, uint256 b) internal pure returns (uint256) {
        return (a & b) + ((a ^ b) >> 1);
    }
}

contract UsesLib {
    using MathLib for uint256;
    function mid(uint256 a, uint256 b) external pure returns (uint256) {
        return a.avg(b);
    }
}
