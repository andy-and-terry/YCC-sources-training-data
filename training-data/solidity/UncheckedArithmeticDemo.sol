// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// Since 0.8 arithmetic reverts on overflow; unchecked{} opts out.
contract UncheckedArithmeticDemo {
    function checkedAdd(uint8 a, uint8 b) external pure returns (uint8) {
        return a + b; // reverts with Panic(0x11) on overflow
    }

    function wrappingAdd(uint8 a, uint8 b) external pure returns (uint8) {
        unchecked {
            return a + b; // 250 + 10 wraps to 4
        }
    }

    function wrappingSub(uint256 a, uint256 b) external pure returns (uint256) {
        unchecked {
            return a - b; // 0 - 1 == type(uint256).max
        }
    }

    // Common gas optimisation: loop counter cannot overflow.
    function sum(uint256[] calldata xs) external pure returns (uint256 total) {
        uint256 n = xs.length;
        for (uint256 i = 0; i < n; ) {
            total += xs[i];
            unchecked { ++i; }
        }
    }

    function tryOverflow(uint8 a, uint8 b) external view returns (bool ok) {
        try this.checkedAdd(a, b) returns (uint8) {
            ok = true;
        } catch {
            ok = false;
        }
    }
}
