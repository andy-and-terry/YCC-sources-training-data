// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// A sealed-bid (blind) auction: bidders commit a hash of their real
// bid plus a secret during the bidding phase, then reveal both during
// the reveal phase. The highest valid revealed bid wins; everyone else
// can withdraw their deposit.
contract BlindAuctionDemo {
    struct Bid {
        bytes32 blindedBid;
        uint256 deposit;
    }

    address public beneficiary;
    uint256 public biddingEnd;
    uint256 public revealEnd;

    mapping(address => Bid) public bids;
    address public highestBidder;
    uint256 public highestBid;
    mapping(address => uint256) public pendingReturns;

    constructor(uint256 biddingTime, uint256 revealTime, address _beneficiary) {
        beneficiary = _beneficiary;
        biddingEnd = block.timestamp + biddingTime;
        revealEnd = biddingEnd + revealTime;
    }

    function bid(bytes32 blindedBid) external payable {
        require(block.timestamp < biddingEnd, "bidding is over");
        require(bids[msg.sender].blindedBid == bytes32(0), "already bid");
        bids[msg.sender] = Bid({blindedBid: blindedBid, deposit: msg.value});
    }

    function reveal(uint256 value, bool fake, bytes32 secret) external {
        require(block.timestamp >= biddingEnd, "bidding not over");
        require(block.timestamp < revealEnd, "reveal period over");

        Bid storage b = bids[msg.sender];
        require(b.blindedBid == keccak256(abi.encodePacked(value, fake, secret)), "invalid reveal");

        uint256 refund = b.deposit;
        if (!fake && b.deposit >= value) {
            if (_placeBid(msg.sender, value)) {
                refund -= value;
            }
        }
        b.blindedBid = bytes32(0);
        pendingReturns[msg.sender] += refund;
    }

    function _placeBid(address bidder, uint256 value) private returns (bool success) {
        if (value <= highestBid) return false;
        if (highestBidder != address(0)) {
            pendingReturns[highestBidder] += highestBid;
        }
        highestBid = value;
        highestBidder = bidder;
        return true;
    }

    function withdraw() external {
        uint256 amount = pendingReturns[msg.sender];
        require(amount > 0, "nothing to withdraw");
        pendingReturns[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
    }

    function settle() external {
        require(block.timestamp >= revealEnd, "reveal not over");
        payable(beneficiary).transfer(highestBid);
    }
}
