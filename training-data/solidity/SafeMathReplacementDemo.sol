// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

library Math {
    function mulDiv(uint256 a, uint256 b, uint256 d) internal pure returns (uint256) {
        require(d != 0, "div by zero");
        return (a * b) / d;
    }

    function min(uint256 a, uint256 b) internal pure returns (uint256) {
        return a < b ? a : b;
    }

    function max(uint256 a, uint256 b) internal pure returns (uint256) {
        return a > b ? a : b;
    }

    function ceilDiv(uint256 a, uint256 b) internal pure returns (uint256) {
        return a == 0 ? 0 : (a - 1) / b + 1;
    }
}

contract SafeMathReplacementDemo {
    using Math for uint256;

    function percent(uint256 amount, uint256 bps) external pure returns (uint256) {
        return amount.mulDiv(bps, 10_000);
    }

    function pages(uint256 items, uint256 perPage) external pure returns (uint256) {
        return items.ceilDiv(perPage);
    }
}
