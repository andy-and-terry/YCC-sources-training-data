// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DailyWithdrawalLimitDemo {
    uint256 public constant DAY = 1 days;
    uint256 public dailyLimit;

    mapping(address => uint256) public balances;
    mapping(address => uint256) public withdrawnToday;
    mapping(address => uint256) public windowStart;

    constructor(uint256 _dailyLimit) {
        dailyLimit = _dailyLimit;
    }

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) external {
        require(balances[msg.sender] >= amount, "insufficient balance");

        if (block.timestamp >= windowStart[msg.sender] + DAY) {
            windowStart[msg.sender] = block.timestamp;
            withdrawnToday[msg.sender] = 0;
        }

        require(withdrawnToday[msg.sender] + amount <= dailyLimit, "daily limit exceeded");

        withdrawnToday[msg.sender] += amount;
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }
}
