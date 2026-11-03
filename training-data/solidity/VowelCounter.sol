// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract VowelCounter {
    function countVowels(string memory s) public pure returns (uint256 total) {
        bytes memory b = bytes(s);
        for (uint256 i = 0; i < b.length; i++) {
            bytes1 c = b[i];
            if (c >= 0x41 && c <= 0x5A) c = bytes1(uint8(c) + 32);
            if (c == "a" || c == "e" || c == "i" || c == "o" || c == "u") total++;
        }
    }
}
