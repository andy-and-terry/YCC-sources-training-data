// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SecondLargest {
    function find(uint256[] calldata xs) external pure returns (uint256 second, bool found) {
        uint256 first;
        bool haveFirst;
        for (uint256 i = 0; i < xs.length; i++) {
            uint256 x = xs[i];
            if (!haveFirst || x > first) {
                if (haveFirst) { second = first; found = true; }
                first = x;
                haveFirst = true;
            } else if (x != first && (!found || x > second)) {
                second = x;
                found = true;
            }
        }
    }
}
