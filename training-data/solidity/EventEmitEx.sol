// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract EventEmitEx {
    event Deposited(address indexed from, uint256 amount);
    mapping(address => uint256) public balances;

    function deposit() external payable {
        balances[msg.sender] += msg.value;
        emit Deposited(msg.sender, msg.value);
    }
}
