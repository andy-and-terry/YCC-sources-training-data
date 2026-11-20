// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ShoelacePolygonArea {
    // Doubled area of a polygon, since Solidity has no floats.
    function twiceArea(int256[] memory xs, int256[] memory ys) public pure returns (uint256) {
        int256 s = 0;
        uint256 n = xs.length;
        for (uint256 i = 0; i < n; i++) {
            uint256 j = (i + 1) % n;
            s += xs[i] * ys[j] - xs[j] * ys[i];
        }
        return uint256(s < 0 ? -s : s);
    }
}
