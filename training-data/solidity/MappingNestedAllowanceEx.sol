// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MappingNestedAllowanceEx {
    mapping(address => mapping(address => uint256)) public allowance;

    function approve(address spender, uint256 amt) external {
        allowance[msg.sender][spender] = amt;
    }
    function spend(address owner, uint256 amt) external {
        require(allowance[owner][msg.sender] >= amt, "allowance");
        allowance[owner][msg.sender] -= amt;
    }
}
