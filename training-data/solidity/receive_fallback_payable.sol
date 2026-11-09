// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Sink {
    uint256 public received;
    event Fallback(bytes data);
    receive() external payable { received += msg.value; }
    fallback() external payable { emit Fallback(msg.data); }
}
