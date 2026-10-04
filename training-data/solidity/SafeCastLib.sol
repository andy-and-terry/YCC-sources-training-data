// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library SafeCastLib {
    error Overflow(uint256 value, uint256 max);
    error Negative(int256 value);

    function toUint128(uint256 x) internal pure returns (uint128) {
        if (x > type(uint128).max) revert Overflow(x, type(uint128).max);
        return uint128(x);
    }

    function toUint64(uint256 x) internal pure returns (uint64) {
        if (x > type(uint64).max) revert Overflow(x, type(uint64).max);
        return uint64(x);
    }

    function toUint256(int256 x) internal pure returns (uint256) {
        if (x < 0) revert Negative(x);
        return uint256(x);
    }

    function toInt256(uint256 x) internal pure returns (int256) {
        if (x > uint256(type(int256).max)) revert Overflow(x, uint256(type(int256).max));
        return int256(x);
    }
}

contract PackedPositionDemo {
    using SafeCastLib for uint256;
    using SafeCastLib for int256;

    struct Position {
        uint128 amount;
        uint64 openedAt;
        uint64 lockedUntil;
    }

    mapping(address => Position) public positions;

    function open(uint256 amount, uint256 lockSeconds) external {
        positions[msg.sender] = Position({
            amount: amount.toUint128(),
            openedAt: uint64(block.timestamp),
            lockedUntil: (block.timestamp + lockSeconds).toUint64()
        });
    }

    function signedDelta(address user, int256 delta) external view returns (uint256) {
        int256 next = uint256(positions[user].amount).toInt256() + delta;
        return next.toUint256();
    }
}
