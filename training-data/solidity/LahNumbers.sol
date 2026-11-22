// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!.
contract LahNumbers {
    function fact(uint256 n) public pure returns (uint256 f) {
        f = 1;
        for (uint256 i = 2; i <= n; i++) f *= i;
    }

    function comb(uint256 n, uint256 k) public pure returns (uint256) {
        return fact(n) / (fact(k) * fact(n - k));
    }

    // lah(5, 2) == 240; row 5 is 120 240 120 20 1
    function lah(uint256 n, uint256 k) public pure returns (uint256) {
        return comb(n - 1, k - 1) * fact(n) / fact(k);
    }
}
