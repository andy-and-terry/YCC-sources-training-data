// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Owned {
    address public owner = msg.sender;
    modifier onlyOwner() { require(msg.sender == owner, "not owner"); _; }
    function transferOwnership(address to) external onlyOwner { owner = to; }
}
