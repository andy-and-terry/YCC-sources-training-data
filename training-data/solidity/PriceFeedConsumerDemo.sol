// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Consumes a Chainlink-style price oracle (AggregatorV3Interface
// shape) to convert an ETH amount into USD, including the staleness
// check every real oracle consumer needs.
interface IPriceFeed {
    function latestRoundData()
        external
        view
        returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound);

    function decimals() external view returns (uint8);
}

contract PriceFeedConsumerDemo {
    IPriceFeed public priceFeed;
    uint256 public constant MAX_STALENESS = 1 hours;

    constructor(address _priceFeed) {
        priceFeed = IPriceFeed(_priceFeed);
    }

    function ethAmountToUsd(uint256 ethAmount) external view returns (uint256 usdValue) {
        (, int256 answer, , uint256 updatedAt, ) = priceFeed.latestRoundData();
        require(answer > 0, "invalid price");
        require(block.timestamp - updatedAt <= MAX_STALENESS, "stale price");

        uint8 feedDecimals = priceFeed.decimals();
        usdValue = (ethAmount * uint256(answer)) / (10 ** feedDecimals);
    }
}
