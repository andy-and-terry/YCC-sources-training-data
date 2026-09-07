// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library ModExpLib {
    function modPow(uint256 base, uint256 exponent, uint256 modulus) internal pure returns (uint256) {
        if (modulus == 1) return 0;
        uint256 result = 1;
        uint256 b = base % modulus;
        uint256 e = exponent;
        while (e > 0) {
            if (e & 1 == 1) {
                result = mulmod(result, b, modulus);
            }
            e >>= 1;
            b = mulmod(b, b, modulus);
        }
        return result;
    }
}
