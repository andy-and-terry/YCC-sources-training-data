// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleReputationScoreDemo {
    mapping(address => int256) public score;
    mapping(address => mapping(address => bool)) public hasRated;

    event Rated(address indexed rater, address indexed target, bool positive);

    function rate(address target, bool positive) external {
        require(target != msg.sender, "cannot rate self");
        require(!hasRated[msg.sender][target], "already rated");
        hasRated[msg.sender][target] = true;
        score[target] += positive ? int256(1) : int256(-1);
        emit Rated(msg.sender, target, positive);
    }
}
