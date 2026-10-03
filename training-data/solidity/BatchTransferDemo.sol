// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Sends tokens to many recipients in a single transaction, saving the
// per-transaction overhead of calling transfer() separately for each
// one. The sum is checked up front so a mid-loop failure never leaves
// balances partially updated.
contract BatchTransferDemo {
    mapping(address => uint256) public balanceOf;

    constructor(uint256 initialSupply) {
        balanceOf[msg.sender] = initialSupply;
    }

    function batchTransfer(address[] calldata recipients, uint256[] calldata amounts) external {
        require(recipients.length == amounts.length, "length mismatch");

        uint256 total = 0;
        for (uint256 i = 0; i < amounts.length; i++) {
            total += amounts[i];
        }
        require(balanceOf[msg.sender] >= total, "insufficient balance");

        balanceOf[msg.sender] -= total;
        for (uint256 i = 0; i < recipients.length; i++) {
            balanceOf[recipients[i]] += amounts[i];
        }
    }
}
