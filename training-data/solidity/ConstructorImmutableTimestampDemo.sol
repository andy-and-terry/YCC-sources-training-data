// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// constant vs immutable: compile-time vs constructor-time values.
contract ConstructorImmutableTimestampDemo {
    uint256 public constant MAX_SUPPLY = 1_000_000;      // fixed at compile time
    uint256 public constant ONE_DAY = 1 days;

    address public immutable owner;                       // set once in constructor
    uint256 public immutable deployedAt;
    uint256 public immutable unlockAt;

    constructor(uint256 lockDays) {
        owner = msg.sender;
        deployedAt = block.timestamp;
        unlockAt = block.timestamp + lockDays * ONE_DAY;
    }

    function isUnlocked() public view returns (bool) {
        return block.timestamp >= unlockAt;
    }

    function secondsRemaining() external view returns (uint256) {
        if (isUnlocked()) return 0;
        return unlockAt - block.timestamp;
    }

    function age() external view returns (uint256) {
        return block.timestamp - deployedAt;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    function ownerOnly() external view onlyOwner returns (string memory) {
        return "welcome";
    }
}
