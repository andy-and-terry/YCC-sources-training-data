// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ConditionalTernaryChainDemo {
    function grade(uint256 score) external pure returns (string memory) {
        return score >= 90 ? "A" : score >= 80 ? "B" : score >= 70 ? "C" : "F";
    }

    function clamp(int256 x, int256 lo, int256 hi) external pure returns (int256) {
        return x < lo ? lo : x > hi ? hi : x;
    }

    function abs(int256 x) external pure returns (uint256) {
        return x >= 0 ? uint256(x) : uint256(-x);
    }
}
