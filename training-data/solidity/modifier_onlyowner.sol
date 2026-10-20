// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Owned {
    address public owner = msg.sender;
    uint public value;

    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    function set(uint v) external onlyOwner {
        value = v;
    }
}
