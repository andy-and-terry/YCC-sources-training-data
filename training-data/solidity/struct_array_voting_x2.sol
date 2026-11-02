// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Poll {
    struct Option { string name; uint256 votes; }
    Option[] public options;
    mapping(address => bool) public voted;
    constructor(string[] memory names) { for (uint i; i < names.length; i++) options.push(Option(names[i], 0)); }
    function vote(uint256 i) external {
        require(!voted[msg.sender], "already voted");
        voted[msg.sender] = true;
        options[i].votes++;
    }
}
