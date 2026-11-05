// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

error Insufficient(uint256 have, uint256 want);

contract Vault {
    mapping(address => uint256) public bal;

    function deposit() external payable { bal[msg.sender] += msg.value; }

    function withdraw(uint256 amt) external {
        if (bal[msg.sender] < amt) revert Insufficient(bal[msg.sender], amt);
        bal[msg.sender] -= amt;
        payable(msg.sender).transfer(amt);
    }
}
