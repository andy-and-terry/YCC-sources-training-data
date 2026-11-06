// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// Amicable pairs: d(a) == b and d(b) == a with a != b.
contract AmicablePairs {
    function d(uint256 n) public pure returns (uint256 s) {
        for (uint256 i = 1; i < n; i++) {
            if (n % i == 0) s += i;
        }
    }

    function isAmicable(uint256 a) external pure returns (bool) {
        uint256 b = d(a);
        return b != a && d(b) == a;
    }
}
