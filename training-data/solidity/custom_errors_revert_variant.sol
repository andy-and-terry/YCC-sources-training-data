// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

error Insufficient(uint256 have, uint256 need);

contract Vault {
    mapping(address => uint256) public bal;
    function withdraw(uint256 n) external {
        if (bal[msg.sender] < n) revert Insufficient(bal[msg.sender], n);
        bal[msg.sender] -= n;
    }
}
