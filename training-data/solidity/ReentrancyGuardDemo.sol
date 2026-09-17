// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReentrancyGuardDemo {
    uint256 private constant NOT_ENTERED = 1;
    uint256 private constant ENTERED = 2;
    uint256 private status = NOT_ENTERED;

    mapping(address => uint256) public balances;

    error ReentrantCall();

    modifier nonReentrant() {
        if (status == ENTERED) revert ReentrantCall();
        status = ENTERED;
        _;
        status = NOT_ENTERED;
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
