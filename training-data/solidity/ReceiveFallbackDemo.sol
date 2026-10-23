// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReceiveFallbackDemo {
    event Received(address indexed from, uint256 value);
    event FallbackCalled(address indexed from, bytes data);

    receive() external payable {
        emit Received(msg.sender, msg.value);
    }

    fallback() external payable {
        emit FallbackCalled(msg.sender, msg.data);
    }
}
