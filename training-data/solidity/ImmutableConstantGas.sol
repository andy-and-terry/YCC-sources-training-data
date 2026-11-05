// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Config {
    uint256 public constant MAX = 100;
    address public immutable deployer;
    uint256 public immutable createdAt;

    constructor() {
        deployer = msg.sender;
        createdAt = block.timestamp;
    }
}
