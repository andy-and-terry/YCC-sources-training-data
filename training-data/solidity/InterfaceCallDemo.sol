// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IPriceFeed {
    function latestPrice() external view returns (uint256);
}

contract MockPriceFeed is IPriceFeed {
    uint256 private price;

    constructor(uint256 initial) {
        price = initial;
    }

    function setPrice(uint256 p) external {
        price = p;
    }

    function latestPrice() external view override returns (uint256) {
        return price;
    }
}

contract InterfaceCallDemo {
    IPriceFeed public feed;

    constructor(IPriceFeed _feed) {
        feed = _feed;
    }

    function quote(uint256 amount) external view returns (uint256) {
        return amount * feed.latestPrice();
    }

    function safeQuote(uint256 amount) external view returns (bool ok, uint256 value) {
        try feed.latestPrice() returns (uint256 p) {
            return (true, amount * p);
        } catch {
            return (false, 0);
        }
    }

    function switchFeed(address newFeed) external {
        require(newFeed.code.length > 0, "not a contract");
        feed = IPriceFeed(newFeed);
    }
}
