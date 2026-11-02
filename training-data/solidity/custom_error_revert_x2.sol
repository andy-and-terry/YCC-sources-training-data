// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Vault {
    error Insufficient(uint256 have, uint256 want);
    mapping(address => uint256) public bal;
    function withdraw(uint256 amt) external {
        if (bal[msg.sender] < amt) revert Insufficient(bal[msg.sender], amt);
        bal[msg.sender] -= amt;
    }
}
