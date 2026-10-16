// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SelfDestructFreeEscapeHatchDemo {
    address public immutable owner;
    bool public retired;

    constructor() {
        owner = msg.sender;
    }

    function retire() external {
        require(msg.sender == owner, "not owner");
        retired = true;
    }

    function sweep(address payable to) external {
        require(msg.sender == owner, "not owner");
        require(retired, "still active");
        to.transfer(address(this).balance);
    }

    receive() external payable {
        require(!retired, "retired");
    }
}
