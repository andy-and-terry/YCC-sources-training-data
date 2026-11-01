// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ReceiveFallbackEx {
    event Received(address from, uint256 amount);
    event Fallback(address from, bytes data);

    receive() external payable { emit Received(msg.sender, msg.value); }
    fallback() external payable { emit Fallback(msg.sender, msg.data); }
}
