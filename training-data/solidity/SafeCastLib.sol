// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

library SafeCastLib {
    error Overflow(uint256 value, uint256 max);

    function toUint128(uint256 x) internal pure returns (uint128) {
        if (x > type(uint128).max) revert Overflow(x, type(uint128).max);
        return uint128(x);
    }

    function toUint64(uint256 x) internal pure returns (uint64) {
        if (x > type(uint64).max) revert Overflow(x, type(uint64).max);
        return uint64(x);
    }

    function toInt256(uint256 x) internal pure returns (int256) {
        if (x > uint256(type(int256).max)) revert Overflow(x, uint256(type(int256).max));
        return int256(x);
    }
}

contract SafeCastDemo {
    using SafeCastLib for uint256;

    function narrow(uint256 x) external pure returns (uint128) {
        return x.toUint128();
    }

    function signed(uint256 x) external pure returns (int256) {
        return x.toInt256();
    }
}
