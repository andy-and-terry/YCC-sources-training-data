// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Auction {
    address public seller;
    address public highestBidder;
    uint256 public highestBid;
    uint256 public endTime;
    bool public ended;
    mapping(address => uint256) public pendingReturns;

    error AuctionEnded();
    error BidTooLow(uint256 sent, uint256 required);
    error NotEnded();

    event NewBid(address indexed bidder, uint256 amount);
    event AuctionFinished(address indexed winner, uint256 amount);

    constructor(uint256 duration) { seller = msg.sender; endTime = block.timestamp + duration; }

    function bid() external payable {
        if (block.timestamp >= endTime) revert AuctionEnded();
        if (msg.value <= highestBid) revert BidTooLow(msg.value, highestBid + 1);
        if (highestBidder != address(0)) pendingReturns[highestBidder] += highestBid;
        highestBidder = msg.sender;
        highestBid = msg.value;
        emit NewBid(msg.sender, msg.value);
    }

    function finish() external {
        if (block.timestamp < endTime) revert NotEnded();
        if (ended) revert AuctionEnded();
        ended = true;
        emit AuctionFinished(highestBidder, highestBid);
        payable(seller).transfer(highestBid);
    }
}
