// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Sink {
    uint256 public received;
    event Got(address from, uint256 v);
    receive() external payable { received += msg.value; emit Got(msg.sender, msg.value); }
    fallback() external payable { revert("unknown call"); }
}
