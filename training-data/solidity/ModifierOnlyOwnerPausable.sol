// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract OnlyOwnerPausable {
    address public owner = msg.sender;
    bool public paused;

    modifier onlyOwner() { require(msg.sender == owner, "not owner"); _; }
    modifier whenNotPaused() { require(!paused, "paused"); _; }

    function setPaused(bool p) external onlyOwner { paused = p; }
    function action() external view whenNotPaused returns (string memory) { return "ok"; }
}
