// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Minimal token-weighted governance: a proposal passes once "for"
// votes exceed "against" votes after the voting period ends.
contract GovernorVotingDemo {
    struct Proposal {
        string description;
        uint256 deadline;
        uint256 forVotes;
        uint256 againstVotes;
        bool executed;
    }

    mapping(address => uint256) public votingPower;
    Proposal[] public proposals;
    mapping(uint256 => mapping(address => bool)) public hasVoted;

    constructor(address[] memory voters, uint256[] memory power) {
        require(voters.length == power.length, "length mismatch");
        for (uint256 i = 0; i < voters.length; i++) {
            votingPower[voters[i]] = power[i];
        }
    }

    function propose(string calldata description, uint256 votingPeriod) external returns (uint256 id) {
        id = proposals.length;
        proposals.push(Proposal({
            description: description,
            deadline: block.timestamp + votingPeriod,
            forVotes: 0,
            againstVotes: 0,
            executed: false
        }));
    }

    function vote(uint256 id, bool support) external {
        require(id < proposals.length, "no such proposal");
        Proposal storage p = proposals[id];
        require(block.timestamp < p.deadline, "voting closed");
        require(!hasVoted[id][msg.sender], "already voted");
        require(votingPower[msg.sender] > 0, "no voting power");

        hasVoted[id][msg.sender] = true;
        if (support) {
            p.forVotes += votingPower[msg.sender];
        } else {
            p.againstVotes += votingPower[msg.sender];
        }
    }

    function execute(uint256 id) external {
        require(id < proposals.length, "no such proposal");
        Proposal storage p = proposals[id];
        require(block.timestamp >= p.deadline, "voting still open");
        require(!p.executed, "already executed");
        require(p.forVotes > p.againstVotes, "proposal rejected");
        p.executed = true;
    }
}
