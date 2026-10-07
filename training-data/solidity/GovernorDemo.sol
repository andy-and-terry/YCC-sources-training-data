// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GovernorDemo {
    struct Proposal {
        string description;
        uint256 votesFor;
        uint256 votesAgainst;
        uint256 deadline;
        bool executed;
    }

    mapping(uint256 => Proposal) public proposals;
    mapping(uint256 => mapping(address => bool)) public hasVoted;
    mapping(address => uint256) public votingPower;
    uint256 public proposalCount;
    uint256 public constant QUORUM = 10;
    uint256 public constant VOTING_PERIOD = 3 days;

    event ProposalCreated(uint256 indexed id, string description, uint256 deadline);
    event VoteCast(uint256 indexed id, address indexed voter, bool support, uint256 weight);
    event ProposalExecuted(uint256 indexed id);

    constructor() {
        votingPower[msg.sender] = 100;
    }

    function grantVotingPower(address account, uint256 power) external {
        votingPower[account] = power;
    }

    function propose(string calldata description) external returns (uint256) {
        uint256 id = proposalCount++;
        proposals[id] = Proposal({
            description: description,
            votesFor: 0,
            votesAgainst: 0,
            deadline: block.timestamp + VOTING_PERIOD,
            executed: false
        });
        emit ProposalCreated(id, description, proposals[id].deadline);
        return id;
    }

    function vote(uint256 id, bool support) external {
        Proposal storage proposal = proposals[id];
        require(block.timestamp < proposal.deadline, "voting closed");
        require(!hasVoted[id][msg.sender], "already voted");

        uint256 weight = votingPower[msg.sender];
        require(weight > 0, "no voting power");

        hasVoted[id][msg.sender] = true;
        if (support) {
            proposal.votesFor += weight;
        } else {
            proposal.votesAgainst += weight;
        }

        emit VoteCast(id, msg.sender, support, weight);
    }

    function execute(uint256 id) external {
        Proposal storage proposal = proposals[id];
        require(block.timestamp >= proposal.deadline, "voting still open");
        require(!proposal.executed, "already executed");
        require(proposal.votesFor + proposal.votesAgainst >= QUORUM, "quorum not met");
        require(proposal.votesFor > proposal.votesAgainst, "proposal rejected");

        proposal.executed = true;
        emit ProposalExecuted(id);
    }
}
