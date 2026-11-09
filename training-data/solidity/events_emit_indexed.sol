// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Notifier {
    event Ping(address indexed from, uint256 value);
    function ping() external payable {
        emit Ping(msg.sender, msg.value);
    }
}
