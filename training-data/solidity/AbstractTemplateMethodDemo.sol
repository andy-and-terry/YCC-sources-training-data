// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

abstract contract Pricing {
    function basePrice() internal view virtual returns (uint256);
    function discountBps() internal view virtual returns (uint256);

    function finalPrice() public view returns (uint256) {
        return basePrice() * (10_000 - discountBps()) / 10_000;
    }
}

contract SeasonalPricing is Pricing {
    uint256 private constant BASE = 2_000;

    function basePrice() internal pure override returns (uint256) {
        return BASE;
    }

    function discountBps() internal view override returns (uint256) {
        return block.timestamp % 2 == 0 ? 1_000 : 500;
    }
}
