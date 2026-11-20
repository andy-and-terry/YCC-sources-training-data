// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract DedupeAdjacent {
    function dedupe(string memory s) public pure returns (string memory) {
        bytes memory b = bytes(s);
        bytes memory out = new bytes(b.length);
        uint256 k = 0;
        for (uint256 i = 0; i < b.length; i++) {
            if (i == 0 || b[i] != b[i - 1]) out[k++] = b[i];
        }
        bytes memory trimmed = new bytes(k);
        for (uint256 i = 0; i < k; i++) trimmed[i] = out[i];
        return string(trimmed);
    }
}
