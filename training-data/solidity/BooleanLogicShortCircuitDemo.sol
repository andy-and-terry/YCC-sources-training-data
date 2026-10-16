// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BooleanLogicShortCircuitDemo {
    uint256 public calls;

    function touch(bool result) internal returns (bool) {
        calls++;
        return result;
    }

    function andShort() external returns (bool) {
        return touch(false) && touch(true); // second call skipped
    }

    function orShort() external returns (bool) {
        return touch(true) || touch(false); // second call skipped
    }

    function xor(bool a, bool b) external pure returns (bool) {
        return a != b;
    }
}
