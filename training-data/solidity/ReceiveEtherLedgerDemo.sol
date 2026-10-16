// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ReceiveEtherLedgerDemo {
    mapping(address => uint256) public deposits;
    uint256 public totalDeposited;

    event Deposited(address indexed from, uint256 amount);

    receive() external payable {
        deposits[msg.sender] += msg.value;
        totalDeposited += msg.value;
        emit Deposited(msg.sender, msg.value);
    }

    function balanceOfContract() external view returns (uint256) {
        return address(this).balance;
    }
}
