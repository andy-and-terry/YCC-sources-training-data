// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract PrefixRangeSum {
    uint256[] private prefix;

    constructor(uint256[] memory values) {
        prefix.push(0);
        for (uint256 i = 0; i < values.length; i++) {
            prefix.push(prefix[i] + values[i]);
        }
    }

    function query(uint256 lo, uint256 hi) external view returns (uint256) {
        require(lo <= hi && hi < prefix.length, "bad range");
        return prefix[hi] - prefix[lo];
    }
}
