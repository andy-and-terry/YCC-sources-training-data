// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// n is triangular iff 8n + 1 is a perfect square.
contract TriangularCheck {
    function isqrt(uint256 n) public pure returns (uint256 r) {
        while ((r + 1) * (r + 1) <= n) r++;
    }

    function isTriangular(uint256 n) public pure returns (bool) {
        uint256 s = 8 * n + 1;
        uint256 r = isqrt(s);
        return r * r == s;
    }

    // Returns 0, 1, 3, 6, 10, 15.
    function upToTwenty() external pure returns (uint256[] memory out) {
        uint256[] memory tmp = new uint256[](21);
        uint256 count;
        for (uint256 n = 0; n <= 20; n++) {
            if (isTriangular(n)) tmp[count++] = n;
        }
        out = new uint256[](count);
        for (uint256 i = 0; i < count; i++) out[i] = tmp[i];
    }
}
