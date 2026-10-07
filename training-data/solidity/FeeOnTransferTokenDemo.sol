// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// A token that deducts a percentage fee on every transfer, routing it
// to a configurable treasury -- a pattern integrators must handle
// explicitly, since the recipient receives less than the amount sent.
contract FeeOnTransferTokenDemo {
    string public name = "FeeToken";
    uint256 public constant FEE_BPS = 200; // 2%
    uint256 public constant BPS_DENOMINATOR = 10000;

    address public treasury;
    mapping(address => uint256) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint256 amount, uint256 fee);

    constructor(uint256 initialSupply, address _treasury) {
        treasury = _treasury;
        balanceOf[msg.sender] = initialSupply;
    }

    function transfer(address to, uint256 amount) external returns (bool) {
        require(balanceOf[msg.sender] >= amount, "insufficient balance");

        uint256 fee = (amount * FEE_BPS) / BPS_DENOMINATOR;
        uint256 netAmount = amount - fee;

        balanceOf[msg.sender] -= amount;
        balanceOf[to] += netAmount;
        balanceOf[treasury] += fee;

        emit Transfer(msg.sender, to, netAmount, fee);
        return true;
    }
}
