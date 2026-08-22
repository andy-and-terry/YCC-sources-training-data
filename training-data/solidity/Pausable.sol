// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

abstract contract Pausable {
    bool public paused;
    address public owner;

    event Paused();
    event Unpaused();

    modifier whenNotPaused() {
        require(!paused, "contract is paused");
        _;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "not owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function pause() external onlyOwner {
        paused = true;
        emit Paused();
    }

    function unpause() external onlyOwner {
        paused = false;
        emit Unpaused();
    }
}
