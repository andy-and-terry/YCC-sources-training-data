// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Allowances {
    mapping(address => mapping(address => uint256)) public allowance;

    function approve(address spender, uint256 amt) external {
        allowance[msg.sender][spender] = amt;
    }

    function remaining(address owner, address spender) external view returns (uint256) {
        return allowance[owner][spender];
    }
}
