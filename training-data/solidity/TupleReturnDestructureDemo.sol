// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract TupleReturnDestructureDemo {
    function minMax(uint256[] memory values) public pure returns (uint256 min, uint256 max) {
        require(values.length > 0, "empty");
        min = values[0];
        max = values[0];
        for (uint256 i = 1; i < values.length; i++) {
            if (values[i] < min) min = values[i];
            if (values[i] > max) max = values[i];
        }
    }

    function divMod(uint256 a, uint256 b) public pure returns (uint256, uint256) {
        return (a / b, a % b);
    }

    function range(uint256[] memory values) external pure returns (uint256) {
        (uint256 lo, uint256 hi) = minMax(values);
        return hi - lo;
    }

    function ignoreFirst(uint256 a, uint256 b) external pure returns (uint256 remainder) {
        (, remainder) = divMod(a, b);
    }

    function swap(uint256 a, uint256 b) external pure returns (uint256, uint256) {
        (a, b) = (b, a);
        return (a, b);
    }

    function quotientOnly(uint256 a, uint256 b) external pure returns (uint256 q) {
        (q, ) = divMod(a, b);
    }
}
