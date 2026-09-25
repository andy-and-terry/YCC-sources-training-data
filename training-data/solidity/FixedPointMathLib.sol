// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Minimal fixed-point arithmetic on 18-decimal "wad" values, the
// convention used throughout most DeFi contracts.
library FixedPointMathLib {
    uint256 internal constant WAD = 1e18;

    function mulWad(uint256 x, uint256 y) internal pure returns (uint256) {
        return (x * y) / WAD;
    }

    function divWad(uint256 x, uint256 y) internal pure returns (uint256) {
        require(y > 0, "division by zero");
        return (x * WAD) / y;
    }

    function toWad(uint256 x) internal pure returns (uint256) {
        return x * WAD;
    }

    function fromWad(uint256 x) internal pure returns (uint256) {
        return x / WAD;
    }
}

contract FixedPointMathDemo {
    using FixedPointMathLib for uint256;

    function multiply(uint256 x, uint256 y) external pure returns (uint256) {
        return x.mulWad(y);
    }

    function divide(uint256 x, uint256 y) external pure returns (uint256) {
        return x.divWad(y);
    }
}
