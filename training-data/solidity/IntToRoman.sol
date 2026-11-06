// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// Integer (1..3999) to Roman numeral using a greedy table.
contract IntToRoman {
    uint16[13] private values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1];
    string[13] private symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"];

    function toRoman(uint256 n) external view returns (string memory) {
        require(n > 0 && n < 4000, "out of range");
        bytes memory out;
        for (uint256 i = 0; i < 13; i++) {
            while (n >= values[i]) {
                out = abi.encodePacked(out, symbols[i]);
                n -= values[i];
            }
        }
        return string(out);
    }
}
