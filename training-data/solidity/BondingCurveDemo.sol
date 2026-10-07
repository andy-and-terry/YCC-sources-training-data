// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BondingCurveDemo {
    mapping(address => uint256) public balanceOf;
    uint256 public totalSupply;
    uint256 public constant SLOPE = 1e15;

    event Bought(address indexed buyer, uint256 amount, uint256 cost);
    event Sold(address indexed seller, uint256 amount, uint256 refund);

    function priceForNext(uint256 amount) public view returns (uint256) {
        uint256 startSupply = totalSupply;
        uint256 endSupply = totalSupply + amount;
        uint256 sumOfSupply = (startSupply + endSupply - 1) * amount / 2;
        return sumOfSupply * SLOPE;
    }

    function buy(uint256 amount) external payable {
        require(amount > 0, "amount must be positive");
        uint256 cost = priceForNext(amount);
        require(msg.value >= cost, "insufficient payment");

        totalSupply += amount;
        balanceOf[msg.sender] += amount;

        uint256 refund = msg.value - cost;
        if (refund > 0) {
            payable(msg.sender).transfer(refund);
        }

        emit Bought(msg.sender, amount, cost);
    }

    function sell(uint256 amount) external {
        require(balanceOf[msg.sender] >= amount, "insufficient balance");

        uint256 startSupply = totalSupply - amount;
        uint256 endSupply = totalSupply;
        uint256 sumOfSupply = (startSupply + endSupply - 1) * amount / 2;
        uint256 refund = sumOfSupply * SLOPE;

        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;

        payable(msg.sender).transfer(refund);
        emit Sold(msg.sender, amount, refund);
    }
}
