// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract FunctionTypeDemo {
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }

    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        return a * b;
    }

    function applyFn(function(uint256, uint256) internal pure returns (uint256) f, uint256 a, uint256 b)
        internal
        pure
        returns (uint256)
    {
        return f(a, b);
    }

    function compute(bool useAdd, uint256 a, uint256 b) external pure returns (uint256) {
        return applyFn(useAdd ? add : mul, a, b);
    }

    function reduce(uint256[] calldata xs) external pure returns (uint256 acc) {
        for (uint256 i = 0; i < xs.length; i++) {
            acc = applyFn(add, acc, xs[i]);
        }
    }
}
