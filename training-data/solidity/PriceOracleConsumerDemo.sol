// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// A minimal Chainlink-style price feed interface, plus a consumer that
// reads it and guards against stale data -- the two things almost
// every oracle-consuming contract needs to get right.
interface IPriceFeed {
    function latestRoundData()
        external
        view
        returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound);

    function decimals() external view returns (uint8);
}

contract PriceOracleConsumerDemo {
    IPriceFeed public immutable priceFeed;
    uint256 public constant MAX_STALENESS = 1 hours;

    constructor(address _priceFeed) {
        priceFeed = IPriceFeed(_priceFeed);
    }

    function getLatestPrice() public view returns (uint256 price, uint8 decimals) {
        (, int256 answer, , uint256 updatedAt, ) = priceFeed.latestRoundData();
        require(answer > 0, "invalid price");
        require(block.timestamp - updatedAt <= MAX_STALENESS, "stale price");
        return (uint256(answer), priceFeed.decimals());
    }

    function convertToUsd(uint256 amountInWei) external view returns (uint256 usdValue) {
        (uint256 price, uint8 decimals) = getLatestPrice();
        // amountInWei has 18 decimals; scale the price up to 18 decimals too.
        usdValue = (amountInWei * price * (10 ** (18 - decimals))) / 1e18;
    }
}
