// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract Bank {
    mapping(address => uint) public balance;
    event Deposit(address indexed who, uint amount);
    function deposit() external payable { balance[msg.sender] += msg.value; emit Deposit(msg.sender, msg.value); }
}
