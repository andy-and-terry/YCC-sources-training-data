// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ModifierArgumentsDemo {
    address public owner = msg.sender;
    uint256 public lastCall;
    uint256 public value;

    modifier cooldown(uint256 secs) {
        require(block.timestamp >= lastCall + secs, "cooling down");
        _;
        lastCall = block.timestamp;
    }

    modifier inRange(uint256 x, uint256 lo, uint256 hi) {
        require(x >= lo && x <= hi, "out of range");
        _;
    }

    modifier onlyBy(address who) {
        require(msg.sender == who, "unauthorized");
        _;
    }

    function setValue(uint256 v) external cooldown(1 hours) inRange(v, 1, 100) {
        value = v;
    }

    function reset() external onlyBy(owner) {
        value = 0;
    }
}
