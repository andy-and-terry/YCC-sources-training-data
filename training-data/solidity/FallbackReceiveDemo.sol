// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FallbackReceiveDemo {
    event Received(address sender, uint256 amount);
    event FallbackCalled(address sender, uint256 amount, bytes data);

    receive() external payable {
        emit Received(msg.sender, msg.value);
    }

    fallback() external payable {
        emit FallbackCalled(msg.sender, msg.value, msg.data);
    }
}
