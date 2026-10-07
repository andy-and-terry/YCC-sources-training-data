// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

type Price is uint128;
type Quantity is uint64;

library PriceMath {
    function wrap(uint128 x) internal pure returns (Price) {
        return Price.wrap(x);
    }

    function unwrap(Price p) internal pure returns (uint128) {
        return Price.unwrap(p);
    }

    function total(Price p, Quantity q) internal pure returns (uint256) {
        return uint256(Price.unwrap(p)) * uint256(Quantity.unwrap(q));
    }
}

contract UserDefinedValueTypeDemo {
    using PriceMath for Price;

    function cost(uint128 price, uint64 qty) external pure returns (uint256) {
        return PriceMath.wrap(price).total(Quantity.wrap(qty));
    }
}
