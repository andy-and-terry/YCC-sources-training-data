// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UncheckedMathDemo {
    function checkedIncrement(uint8 x) external pure returns (uint8) {
        return x + 1;
    }

    function uncheckedIncrement(uint8 x) external pure returns (uint8) {
        unchecked {
            return x + 1;
        }
    }

    function sumRange(uint256 n) external pure returns (uint256 total) {
        unchecked {
            for (uint256 i = 0; i < n; i++) {
                total += i;
            }
        }
    }

    function safeSub(uint256 a, uint256 b) external pure returns (uint256) {
        require(a >= b, "underflow");
        unchecked {
            return a - b;
        }
    }
}
