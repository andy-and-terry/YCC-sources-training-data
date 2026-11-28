// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Token {
    mapping(address => uint256) public balanceOf;
    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor() { balanceOf[msg.sender] = 1000; }

    function transfer(address to, uint256 v) external {
        require(balanceOf[msg.sender] >= v, "insufficient");
        balanceOf[msg.sender] -= v;
        balanceOf[to] += v;
        emit Transfer(msg.sender, to, v);
    }
}
