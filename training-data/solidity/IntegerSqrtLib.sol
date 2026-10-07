// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library IntegerSqrtLib {
    // Babylonian (Newton) method: floor(sqrt(x)) using integer math only.
    function sqrt(uint256 x) internal pure returns (uint256 y) {
        if (x == 0) return 0;
        uint256 z = (x + 1) / 2;
        y = x;
        while (z < y) {
            y = z;
            z = (x / z + z) / 2;
        }
    }

    function isPerfectSquare(uint256 x) internal pure returns (bool) {
        uint256 r = sqrt(x);
        return r * r == x;
    }

    function ceilSqrt(uint256 x) internal pure returns (uint256) {
        uint256 r = sqrt(x);
        return r * r == x ? r : r + 1;
    }
}

contract IntegerSqrtDemo {
    function floorSqrt(uint256 x) external pure returns (uint256) {
        return IntegerSqrtLib.sqrt(x);
    }

    function ceilSqrt(uint256 x) external pure returns (uint256) {
        return IntegerSqrtLib.ceilSqrt(x);
    }

    function perfect(uint256 x) external pure returns (bool) {
        return IntegerSqrtLib.isPerfectSquare(x);
    }
}
