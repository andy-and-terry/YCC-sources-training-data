// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TokenVestingDemo {
    address public beneficiary;
    uint256 public totalAmount;
    uint256 public startTime;
    uint256 public duration;
    uint256 public released;

    constructor(address _beneficiary, uint256 _totalAmount, uint256 _duration) {
        beneficiary = _beneficiary;
        totalAmount = _totalAmount;
        startTime = block.timestamp;
        duration = _duration;
    }

    function vestedAmount() public view returns (uint256) {
        if (block.timestamp < startTime) return 0;
        if (block.timestamp >= startTime + duration) return totalAmount;
        return (totalAmount * (block.timestamp - startTime)) / duration;
    }

    function release() external returns (uint256) {
        uint256 unreleased = vestedAmount() - released;
        released += unreleased;
        return unreleased;
    }
}
