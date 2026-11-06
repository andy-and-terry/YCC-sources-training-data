// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// Fermat primality test; Carmichael number 561 fools it.
contract FermatPrimality {
    function powmod(uint256 b, uint256 e, uint256 m) public pure returns (uint256 r) {
        r = 1;
        b %= m;
        while (e > 0) {
            if (e & 1 == 1) r = mulmod(r, b, m);
            b = mulmod(b, b, m);
            e >>= 1;
        }
    }

    function probablyPrime(uint256 n) external pure returns (bool) {
        return n > 2 && powmod(2, n - 1, n) == 1;
    }
}
