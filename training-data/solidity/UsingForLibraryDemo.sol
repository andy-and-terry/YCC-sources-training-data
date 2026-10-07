// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library UintHelpers {
    function isEven(uint256 self) internal pure returns (bool) {
        return self % 2 == 0;
    }

    function clamp(uint256 self, uint256 lo, uint256 hi) internal pure returns (uint256) {
        if (self < lo) return lo;
        if (self > hi) return hi;
        return self;
    }
}

contract UsingForLibraryDemo {
    using UintHelpers for uint256;

    function check(uint256 value) external pure returns (bool) {
        return value.isEven();
    }

    function bound(uint256 value) external pure returns (uint256) {
        return value.clamp(10, 100);
    }
}
