// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract PayableConstructorDemo {
    address public immutable creator;
    uint256 public immutable initialFunding;

    constructor() payable {
        creator = msg.sender;
        initialFunding = msg.value;
    }

    function poolSize() external view returns (uint256) {
        return address(this).balance;
    }

    function topUp() external payable {}
}
