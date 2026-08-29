// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleVotingDemo {
    mapping(address => bool) public hasVoted;
    mapping(uint256 => uint256) public votes;

    function vote(uint256 candidateId) external {
        require(!hasVoted[msg.sender], "Already voted");
        hasVoted[msg.sender] = true;
        votes[candidateId]++;
    }
}
