// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Moebius function: 0 if n has a squared prime factor, else (-1)^k.
contract MobiusFunction {
    function mobius(uint256 n) public pure returns (int256) {
        int256 result = 1;
        for (uint256 p = 2; p * p <= n; p++) {
            if (n % p == 0) {
                n /= p;
                if (n % p == 0) return 0;
                result = -result;
            }
        }
        return n > 1 ? -result : result;
    }

    function firstThirty() public pure returns (int256[30] memory out) {
        for (uint256 i = 0; i < 30; i++) out[i] = mobius(i + 1);
    }
}
