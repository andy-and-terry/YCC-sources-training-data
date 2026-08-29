// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ModifierDemo {
    address public owner;
    bool public locked;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    modifier noReentrancy() {
        require(!locked, "Reentrant call");
        locked = true;
        _;
        locked = false;
    }

    function protectedAction() external onlyOwner noReentrancy {
        // safe, guarded action
    }
}
