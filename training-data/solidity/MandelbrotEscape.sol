// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MandelbrotEscape {
    int256 constant SCALE = 1000;

    function escape(int256 cr, int256 ci) public pure returns (uint256 n) {
        int256 zr = 0;
        int256 zi = 0;
        while (n < 30 && (zr * zr + zi * zi) / SCALE < 4 * SCALE) {
            int256 t = (zr * zr - zi * zi) / SCALE + cr;
            zi = (2 * zr * zi) / SCALE + ci;
            zr = t;
            n++;
        }
    }
}
