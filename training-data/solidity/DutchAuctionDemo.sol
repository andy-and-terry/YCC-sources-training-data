// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DutchAuctionDemo {
    address public seller;
    uint256 public startPrice;
    uint256 public startTime;
    uint256 public duration;
    uint256 public priceDropPerSecond;
    bool public sold;

    constructor(uint256 _startPrice, uint256 _duration, uint256 _priceDropPerSecond) {
        seller = msg.sender;
        startPrice = _startPrice;
        startTime = block.timestamp;
        duration = _duration;
        priceDropPerSecond = _priceDropPerSecond;
    }

    function currentPrice() public view returns (uint256) {
        uint256 elapsed = block.timestamp - startTime;
        uint256 drop = elapsed * priceDropPerSecond;
        if (drop >= startPrice) return 0;
        return startPrice - drop;
    }

    function buy() external payable {
        require(!sold, "already sold");
        require(block.timestamp < startTime + duration, "auction expired");

        uint256 price = currentPrice();
        require(msg.value >= price, "insufficient payment");

        sold = true;
        payable(seller).transfer(price);

        uint256 refund = msg.value - price;
        if (refund > 0) {
            payable(msg.sender).transfer(refund);
        }
    }
}
