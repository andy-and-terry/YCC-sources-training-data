// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MappingNestedDemo {
    mapping(address => mapping(address => uint256)) public allowances;

    function approve(address spender, uint256 amount) external {
        allowances[msg.sender][spender] = amount;
    }

    function getAllowance(address owner, address spender) external view returns (uint256) {
        return allowances[owner][spender];
    }
}
