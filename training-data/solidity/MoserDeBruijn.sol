// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Moser-de Bruijn sequence: binary digits of n read in base 4.
contract MoserDeBruijn {
    function moser(uint256 n) public pure returns (uint256 result) {
        uint256 place = 1;
        while (n > 0) {
            if (n & 1 == 1) result += place;
            n >>= 1;
            place *= 4;
        }
    }
}
