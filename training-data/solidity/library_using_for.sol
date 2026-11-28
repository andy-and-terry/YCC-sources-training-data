// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

library MathLib {
    function max(uint256 a, uint256 b) internal pure returns (uint256) { return a > b ? a : b; }
}

contract UseLib {
    using MathLib for uint256;
    function biggest(uint256 a, uint256 b) external pure returns (uint256) { return a.max(b); }
}
