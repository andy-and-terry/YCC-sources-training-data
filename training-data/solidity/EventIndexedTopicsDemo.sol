// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract EventIndexedTopicsDemo {
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Note(string indexed tag, string body);
    event Anon(uint256 a, uint256 b) anonymous;

    function send(address to, uint256 value) external {
        emit Transfer(msg.sender, to, value);
    }

    function note(string calldata tag, string calldata body) external {
        emit Note(tag, body);
    }

    function anon(uint256 a, uint256 b) external {
        emit Anon(a, b);
    }
}
