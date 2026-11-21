// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Amicable pairs: s(a) = b and s(b) = a with a < b.
contract AmicablePairs {
    function s(uint256 n) public pure returns (uint256 t) {
        for (uint256 d = 1; d < n; d++) {
            if (n % d == 0) t += d;
        }
    }

    function isAmicableStart(uint256 a) public pure returns (bool) {
        uint256 b = s(a);
        return b > a && s(b) == a;
    }

    // amicablePartner(220) == 284, amicablePartner(1184) == 1210
    function amicablePartner(uint256 a) public pure returns (uint256) {
        return isAmicableStart(a) ? s(a) : 0;
    }
}
