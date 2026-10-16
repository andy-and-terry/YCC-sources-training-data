// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ConstantExpressionsDemo {
    uint256 public constant SECONDS_PER_DAY = 24 * 60 * 60;
    uint256 public constant YEAR = 365 * SECONDS_PER_DAY;
    bytes32 public constant TAG = keccak256("ConstantExpressionsDemo.TAG");
    uint256 public constant MAX_BPS = 10_000;
    string public constant VERSION = "1.0.0";

    function daysToSeconds(uint256 d) external pure returns (uint256) {
        return d * SECONDS_PER_DAY;
    }

    function applyFee(uint256 amount, uint256 bps) external pure returns (uint256) {
        require(bps <= MAX_BPS, "bps too high");
        return amount * (MAX_BPS - bps) / MAX_BPS;
    }
}
