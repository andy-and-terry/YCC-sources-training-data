// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Dutch auction: the price starts high and falls linearly over time
// until a buyer accepts it, or the auction expires unsold.
contract DutchAuctionDemo {
    address public seller;
    uint256 public startPrice;
    uint256 public startAt;
    uint256 public duration;
    uint256 public discountRatePerSecond;
    bool public sold;

    constructor(uint256 _startPrice, uint256 _duration, uint256 _discountRatePerSecond) {
        seller = msg.sender;
        startPrice = _startPrice;
        startAt = block.timestamp;
        duration = _duration;
        discountRatePerSecond = _discountRatePerSecond;
    }

    function currentPrice() public view returns (uint256) {
        uint256 elapsed = block.timestamp - startAt;
        if (elapsed >= duration) return 0;
        uint256 discount = discountRatePerSecond * elapsed;
        if (discount >= startPrice) return 0;
        return startPrice - discount;
    }

    function buy() external payable {
        require(!sold, "already sold");
        require(block.timestamp < startAt + duration, "auction expired");

        uint256 price = currentPrice();
        require(msg.value >= price, "insufficient payment");

        sold = true;
        payable(seller).transfer(price);
        if (msg.value > price) {
            payable(msg.sender).transfer(msg.value - price);
        }
    }
}
