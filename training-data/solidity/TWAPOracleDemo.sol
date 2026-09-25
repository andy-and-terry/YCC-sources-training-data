// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Simplified time-weighted average price oracle: every update accrues
// price * elapsedTime into a running cumulative total, and the average
// over any window is the difference in the cumulative divided by the
// elapsed time, resisting single-block price manipulation.
contract TWAPOracleDemo {
    uint256 public price;
    uint256 public priceCumulative;
    uint256 public lastUpdateTime;

    constructor(uint256 initialPrice) {
        price = initialPrice;
        lastUpdateTime = block.timestamp;
    }

    function update(uint256 newPrice) external {
        uint256 elapsed = block.timestamp - lastUpdateTime;
        priceCumulative += price * elapsed;
        price = newPrice;
        lastUpdateTime = block.timestamp;
    }

    // Returns the time-weighted average price since `sinceCumulative`
    // was recorded at `sinceTime`, e.g. taken from a snapshot earlier
    // in the observation window.
    function consult(uint256 sinceCumulative, uint256 sinceTime) external view returns (uint256) {
        require(block.timestamp > sinceTime, "invalid window");
        uint256 currentCumulative = priceCumulative + price * (block.timestamp - lastUpdateTime);
        return (currentCumulative - sinceCumulative) / (block.timestamp - sinceTime);
    }
}
