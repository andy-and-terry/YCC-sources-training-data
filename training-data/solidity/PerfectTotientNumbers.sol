// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
contract PerfectTotientNumbers {
    function gcd(uint256 a, uint256 b) internal pure returns (uint256) {
        while (b != 0) {
            (a, b) = (b, a % b);
        }
        return a;
    }

    function phi(uint256 n) public pure returns (uint256 c) {
        for (uint256 k = 1; k <= n; k++) {
            if (gcd(k, n) == 1) c++;
        }
    }

    function isPerfectTotient(uint256 n) public pure returns (bool) {
        uint256 total = 0;
        uint256 m = n;
        while (m > 1) {
            m = phi(m);
            total += m;
        }
        return total == n;
    }
}
