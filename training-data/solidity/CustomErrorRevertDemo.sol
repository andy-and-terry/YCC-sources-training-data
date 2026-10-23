// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CustomErrorRevertDemo {
    error InsufficientBalance(uint256 available, uint256 required);

    mapping(address => uint256) public balances;

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) external {
        uint256 bal = balances[msg.sender];
        if (bal < amount) revert InsufficientBalance(bal, amount);
        balances[msg.sender] = bal - amount;
        payable(msg.sender).transfer(amount);
    }
}
