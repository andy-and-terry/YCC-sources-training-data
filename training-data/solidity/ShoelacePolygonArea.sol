// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ShoelacePolygonArea {
    struct Point { int256 x; int256 y; }

    /// Returns twice the polygon area to stay in integers.
    function doubleArea(Point[] memory p) public pure returns (uint256) {
        int256 s = 0;
        for (uint256 i = 0; i < p.length; i++) {
            Point memory a = p[i];
            Point memory b = p[(i + 1) % p.length];
            s += a.x * b.y - b.x * a.y;
        }
        return uint256(s < 0 ? -s : s);
    }
}
