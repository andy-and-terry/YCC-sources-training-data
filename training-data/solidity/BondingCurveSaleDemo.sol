// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BondingCurveSaleDemo {
    mapping(address => uint256) public balanceOf;
    uint256 public totalSupply;
    uint256 public constant SLOPE = 1e15;

    event Bought(address indexed buyer, uint256 amount, uint256 cost);
    event Sold(address indexed seller, uint256 amount, uint256 refund);

    // Linear price curve: price(supply) = SLOPE * supply. The cost to move
    // supply from `start` to `end` is the area under that line, i.e. the
    // average price over the range times the number of tokens.
    function priceFor(uint256 amount) public view returns (uint256) {
        uint256 start = totalSupply;
        uint256 end = totalSupply + amount;
        return SLOPE * (start + end) * amount / 2;
    }

    function buy(uint256 amount) external payable {
        uint256 cost = priceFor(amount);
        require(msg.value >= cost, "insufficient payment");
        totalSupply += amount;
        balanceOf[msg.sender] += amount;
        if (msg.value > cost) {
            payable(msg.sender).transfer(msg.value - cost);
        }
        emit Bought(msg.sender, amount, cost);
    }

    function sell(uint256 amount) external {
        require(balanceOf[msg.sender] >= amount, "insufficient balance");
        uint256 end = totalSupply;
        uint256 start = totalSupply - amount;
        uint256 refund = SLOPE * (start + end) * amount / 2;
        totalSupply -= amount;
        balanceOf[msg.sender] -= amount;
        payable(msg.sender).transfer(refund);
        emit Sold(msg.sender, amount, refund);
    }
}
