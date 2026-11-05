// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Notifier {
    event Sent(address indexed from, address indexed to, uint256 amount);

    function send(address to, uint256 amount) external {
        emit Sent(msg.sender, to, amount);
    }
}
