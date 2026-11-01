// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ImmutableConstantEx {
    uint256 public constant FEE_BPS = 25;
    address public immutable treasury;
    uint256 public immutable deployedAt;

    constructor(address t) { treasury = t; deployedAt = block.timestamp; }

    function fee(uint256 amt) external pure returns (uint256) { return amt * FEE_BPS / 10_000; }
}
