// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ModifierOwnerEx {
    address public owner = msg.sender;
    uint256 public value;

    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    function set(uint256 v) external onlyOwner { value = v; }
}
