// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ErrorCustomRevertDemo {
    error InsufficientBalance(uint256 requested, uint256 available);

    mapping(address => uint256) public balances;

    function withdraw(uint256 amount) external {
        uint256 balance = balances[msg.sender];
        if (amount > balance) {
            revert InsufficientBalance(amount, balance);
        }
        balances[msg.sender] -= amount;
    }
}
