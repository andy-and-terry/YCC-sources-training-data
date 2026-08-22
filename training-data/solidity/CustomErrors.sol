// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

error InsufficientBalance(uint256 available, uint256 requested);
error Unauthorized(address caller);

contract CustomErrorsDemo {
    mapping(address => uint256) public balances;
    address public admin;

    constructor() {
        admin = msg.sender;
        balances[msg.sender] = 100;
    }

    function withdraw(uint256 amount) external {
        if (balances[msg.sender] < amount) {
            revert InsufficientBalance(balances[msg.sender], amount);
        }
        balances[msg.sender] -= amount;
    }

    function adminOnly() external view {
        if (msg.sender != admin) {
            revert Unauthorized(msg.sender);
        }
    }
}
