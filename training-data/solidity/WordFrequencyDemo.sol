// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WordFrequencyDemo {
    mapping(string => uint256) public frequency;
    string[] public seenWords;

    function addWord(string calldata word) external {
        if (frequency[word] == 0) {
            seenWords.push(word);
        }
        frequency[word]++;
    }

    function getFrequency(string calldata word) external view returns (uint256) {
        return frequency[word];
    }
}
