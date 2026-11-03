// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ListMode {
    function mode(uint8[] memory items) public pure returns (uint8 best) {
        uint256[256] memory counts;
        uint256 top;
        for (uint256 i = 0; i < items.length; i++) {
            counts[items[i]]++;
            if (counts[items[i]] > top) {
                top = counts[items[i]];
                best = items[i];
            }
        }
    }
}
