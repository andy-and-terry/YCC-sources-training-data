// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MultiSigWalletDemo {
    address[] public owners;
    uint256 public required;
    mapping(uint256 => mapping(address => bool)) public confirmations;
    mapping(uint256 => bool) public executed;

    constructor(address[] memory _owners, uint256 _required) {
        owners = _owners;
        required = _required;
    }

    function confirmTransaction(uint256 txId) external {
        confirmations[txId][msg.sender] = true;
    }

    function isConfirmed(uint256 txId) public view returns (bool) {
        uint256 count = 0;
        for (uint256 i = 0; i < owners.length; i++) {
            if (confirmations[txId][owners[i]]) count++;
        }
        return count >= required;
    }
}
