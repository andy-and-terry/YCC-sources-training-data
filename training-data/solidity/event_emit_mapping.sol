// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ledger {
    mapping(address => uint) public balances;
    event Deposit(address indexed who, uint amount);

    function deposit() external payable {
        balances[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }
}
