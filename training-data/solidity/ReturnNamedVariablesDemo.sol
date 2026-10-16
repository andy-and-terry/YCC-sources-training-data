// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ReturnNamedVariablesDemo {
    function stats(uint256[] calldata xs)
        external
        pure
        returns (uint256 min, uint256 max, uint256 sum)
    {
        require(xs.length > 0, "empty");
        min = type(uint256).max;
        for (uint256 i = 0; i < xs.length; i++) {
            if (xs[i] < min) min = xs[i];
            if (xs[i] > max) max = xs[i];
            sum += xs[i];
        }
    }

    function earlyReturn(uint256 x) external pure returns (string memory label) {
        if (x == 0) return "zero";
        label = "positive";
    }
}
