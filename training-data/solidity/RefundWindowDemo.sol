// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// Deposits can be refunded until a deadline; afterwards the owner sweeps funds.
contract RefundWindowDemo {
    address public immutable owner;
    uint256 public immutable deadline;
    mapping(address => uint256) public deposits;

    event Deposited(address indexed from, uint256 amount);
    event Refunded(address indexed to, uint256 amount);

    constructor(uint256 windowSeconds) {
        owner = msg.sender;
        deadline = block.timestamp + windowSeconds;
    }

    function deposit() external payable {
        require(block.timestamp < deadline, "closed");
        deposits[msg.sender] += msg.value;
        emit Deposited(msg.sender, msg.value);
    }

    function refund() external {
        require(block.timestamp < deadline, "window over");
        uint256 amount = deposits[msg.sender];
        require(amount > 0, "no deposit");
        deposits[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
        emit Refunded(msg.sender, amount);
    }

    function sweep() external {
        require(msg.sender == owner && block.timestamp >= deadline, "not allowed");
        payable(owner).transfer(address(this).balance);
    }
}
