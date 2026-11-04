// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract OrdinalSuffix {
    function suffix(uint256 n) public pure returns (string memory) {
        uint256 r100 = n % 100;
        if (r100 >= 11 && r100 <= 13) return "th";
        uint256 r10 = n % 10;
        if (r10 == 1) return "st";
        if (r10 == 2) return "nd";
        if (r10 == 3) return "rd";
        return "th";
    }
}
