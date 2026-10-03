// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DutchAuctionDemo {
    address public seller;
    uint256 public startingPrice;
    uint256 public startAt;
    uint256 public discountRate;
    uint256 public constant DURATION = 7 days;
    bool public sold;

    constructor(uint256 _startingPrice, uint256 _discountRate) {
        require(_startingPrice >= _discountRate * DURATION, "starting price too low");
        seller = msg.sender;
        startingPrice = _startingPrice;
        discountRate = _discountRate;
        startAt = block.timestamp;
    }

    function getPrice() public view returns (uint256) {
        uint256 elapsed = block.timestamp - startAt;
        uint256 discount = discountRate * elapsed;
        return startingPrice - discount;
    }

    function buy() external payable {
        require(!sold, "already sold");
        uint256 price = getPrice();
        require(msg.value >= price, "insufficient payment");
        sold = true;

        uint256 refund = msg.value - price;
        if (refund > 0) {
            payable(msg.sender).transfer(refund);
        }
        payable(seller).transfer(price);
    }
}
