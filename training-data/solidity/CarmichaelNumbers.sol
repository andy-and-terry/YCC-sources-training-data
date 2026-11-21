// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Carmichael numbers via Korselt's criterion: n is squarefree, composite,
// and p - 1 divides n - 1 for every prime factor p.
contract CarmichaelNumbers {
    function isCarmichael(uint256 n) public pure returns (bool) {
        uint256 m = n;
        uint256 count = 0;
        for (uint256 p = 2; p * p <= m; p++) {
            if (m % p == 0) {
                m /= p;
                if (m % p == 0) return false;
                if ((n - 1) % (p - 1) != 0) return false;
                count++;
            }
        }
        if (m > 1) {
            if ((n - 1) % (m - 1) != 0) return false;
            count++;
        }
        return count >= 2;
    }
}
