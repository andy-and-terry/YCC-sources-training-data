// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BaseV1 {
    address public owner;
    uint256 public createdAt;
    uint256[48] private __gap;

    function initialize() external {
        require(owner == address(0), "already initialized");
        owner = msg.sender;
        createdAt = block.timestamp;
    }
}

contract ChildV2 is BaseV1 {
    uint256 public extraField;

    function setExtra(uint256 x) external {
        require(msg.sender == owner, "not owner");
        extraField = x;
    }
}
