// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library GcdLcmLib {
    function gcd(uint256 a, uint256 b) internal pure returns (uint256) {
        while (b != 0) {
            (a, b) = (b, a % b);
        }
        return a;
    }

    function lcm(uint256 a, uint256 b) internal pure returns (uint256) {
        return (a * b) / gcd(a, b);
    }
}
