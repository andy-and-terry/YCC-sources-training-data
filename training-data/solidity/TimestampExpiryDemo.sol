// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract TimestampExpiryDemo {
    struct Offer {
        address seller;
        uint256 price;
        uint64 expiresAt;
        bool taken;
    }

    Offer[] public offers;

    function list(uint256 price, uint64 ttl) external returns (uint256 id) {
        offers.push(Offer(msg.sender, price, uint64(block.timestamp) + ttl, false));
        id = offers.length - 1;
    }

    function isActive(uint256 id) public view returns (bool) {
        Offer storage o = offers[id];
        return !o.taken && block.timestamp < o.expiresAt;
    }

    function take(uint256 id) external payable {
        require(isActive(id), "offer inactive");
        require(msg.value == offers[id].price, "wrong price");
        offers[id].taken = true;
        payable(offers[id].seller).transfer(msg.value);
    }
}
