// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommitRevealDemo {
    error AlreadyCommitted();
    error NoCommitment();
    error RevealMismatch();

    mapping(address => bytes32) public commitments;
    mapping(address => uint256) public revealedValues;

    event Committed(address indexed player, bytes32 commitment);
    event Revealed(address indexed player, uint256 value);

    function commit(bytes32 commitment) external {
        if (commitments[msg.sender] != bytes32(0)) revert AlreadyCommitted();
        commitments[msg.sender] = commitment;
        emit Committed(msg.sender, commitment);
    }

    function reveal(uint256 value, bytes32 salt) external {
        bytes32 commitment = commitments[msg.sender];
        if (commitment == bytes32(0)) revert NoCommitment();
        if (keccak256(abi.encodePacked(value, salt)) != commitment) revert RevealMismatch();
        revealedValues[msg.sender] = value;
        emit Revealed(msg.sender, value);
    }
}
