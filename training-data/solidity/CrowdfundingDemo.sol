// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CrowdfundingDemo {
    address public creator;
    uint256 public goal;
    uint256 public deadline;
    uint256 public totalRaised;
    bool public claimed;
    mapping(address => uint256) public contributions;

    event Contributed(address indexed backer, uint256 amount);
    event Claimed(uint256 amount);
    event Refunded(address indexed backer, uint256 amount);

    constructor(uint256 _goal, uint256 _durationSeconds) {
        creator = msg.sender;
        goal = _goal;
        deadline = block.timestamp + _durationSeconds;
    }

    function contribute() external payable {
        require(block.timestamp < deadline, "campaign ended");
        require(msg.value > 0, "must send funds");

        contributions[msg.sender] += msg.value;
        totalRaised += msg.value;

        emit Contributed(msg.sender, msg.value);
    }

    function claim() external {
        require(msg.sender == creator, "not creator");
        require(block.timestamp >= deadline, "campaign still active");
        require(totalRaised >= goal, "goal not reached");
        require(!claimed, "already claimed");

        claimed = true;
        payable(creator).transfer(address(this).balance);

        emit Claimed(totalRaised);
    }

    function refund() external {
        require(block.timestamp >= deadline, "campaign still active");
        require(totalRaised < goal, "goal was reached");

        uint256 amount = contributions[msg.sender];
        require(amount > 0, "no contribution to refund");

        contributions[msg.sender] = 0;
        payable(msg.sender).transfer(amount);

        emit Refunded(msg.sender, amount);
    }
}
