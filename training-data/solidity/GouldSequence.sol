// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract GouldSequence {
    function popcount(uint256 n) internal pure returns (uint256 c) {
        while (n > 0) {
            c += n & 1;
            n >>= 1;
        }
    }

    function gould(uint256 n) public pure returns (uint256) {
        return 1 << popcount(n);
    }
}
