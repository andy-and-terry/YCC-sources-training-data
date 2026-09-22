// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EscrowDemo {
    address public buyer;
    address public seller;
    address public arbiter;
    uint256 public amount;
    bool public released;
    bool public refunded;

    constructor(address _seller, address _arbiter) payable {
        buyer = msg.sender;
        seller = _seller;
        arbiter = _arbiter;
        amount = msg.value;
    }

    modifier onlyArbiter() {
        require(msg.sender == arbiter, "not arbiter");
        _;
    }

    function releaseToSeller() external onlyArbiter {
        require(!released && !refunded, "already settled");
        released = true;
        payable(seller).transfer(amount);
    }

    function refundToBuyer() external onlyArbiter {
        require(!released && !refunded, "already settled");
        refunded = true;
        payable(buyer).transfer(amount);
    }
}
