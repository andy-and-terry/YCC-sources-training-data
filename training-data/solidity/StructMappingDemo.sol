// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StructMappingDemo {
    struct User {
        string name;
        uint256 balance;
        bool active;
    }

    mapping(address => User) public users;

    function register(string calldata name) external {
        users[msg.sender] = User({ name: name, balance: 0, active: true });
    }

    function deposit() external payable {
        require(users[msg.sender].active, "User not registered");
        users[msg.sender].balance += msg.value;
    }
}
