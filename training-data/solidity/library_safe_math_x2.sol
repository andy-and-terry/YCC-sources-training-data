// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

library Clamp {
    function clamp(uint256 x, uint256 lo, uint256 hi) internal pure returns (uint256) {
        return x < lo ? lo : (x > hi ? hi : x);
    }
}

contract UsesClamp {
    using Clamp for uint256;
    function f(uint256 x) external pure returns (uint256) { return x.clamp(10, 20); }
}
