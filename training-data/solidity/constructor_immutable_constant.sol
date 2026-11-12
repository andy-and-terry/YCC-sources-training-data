// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract Token {
    uint public constant DECIMALS = 18;
    address public immutable admin;
    uint public immutable cap;
    constructor(uint _cap) { admin = msg.sender; cap = _cap; }
}
