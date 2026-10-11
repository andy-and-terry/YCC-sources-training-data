// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ModifierReentrancyLockDemo {
    uint256 private constant UNLOCKED = 1;
    uint256 private constant LOCKED = 2;
    uint256 private status = UNLOCKED;
    mapping(address => uint256) public balances;

    modifier nonReentrant() {
        require(status == UNLOCKED, "reentrant");
        status = LOCKED;
        _;
        status = UNLOCKED;
    }

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() external nonReentrant {
        uint256 amount = balances[msg.sender];
        balances[msg.sender] = 0;
        (bool ok, ) = msg.sender.call{value: amount}("");
        require(ok, "transfer failed");
    }
}
