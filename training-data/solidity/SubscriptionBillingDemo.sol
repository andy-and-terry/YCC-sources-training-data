// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SubscriptionBillingDemo {
    uint256 public constant PRICE = 0.01 ether;
    uint256 public constant PERIOD = 30 days;

    address public immutable owner;
    mapping(address => uint256) public paidUntil;

    event Subscribed(address indexed user, uint256 paidUntil);

    constructor() {
        owner = msg.sender;
    }

    function subscribe(uint256 periods) external payable {
        require(periods > 0, "no periods");
        require(msg.value == PRICE * periods, "wrong payment");

        uint256 start = paidUntil[msg.sender] > block.timestamp ? paidUntil[msg.sender] : block.timestamp;
        paidUntil[msg.sender] = start + PERIOD * periods;
        emit Subscribed(msg.sender, paidUntil[msg.sender]);
    }

    function isActive(address user) external view returns (bool) {
        return paidUntil[user] > block.timestamp;
    }

    function withdraw() external {
        require(msg.sender == owner, "not owner");
        (bool ok, ) = owner.call{value: address(this).balance}("");
        require(ok, "transfer failed");
    }
}
