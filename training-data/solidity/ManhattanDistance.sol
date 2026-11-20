// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ManhattanDistance {
    function distance(int256[] memory a, int256[] memory b) public pure returns (uint256 d) {
        for (uint256 i = 0; i < a.length; i++) {
            int256 diff = a[i] - b[i];
            d += uint256(diff < 0 ? -diff : diff);
        }
    }
}
