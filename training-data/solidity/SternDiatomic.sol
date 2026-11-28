// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract SternDiatomic {
    function sequence(uint256 count) external pure returns (uint256[] memory seq) {
        seq = new uint256[](count < 2 ? 2 : count);
        seq[1] = 1;
        for (uint256 i = 2; i < count; i++) {
            uint256 h = i / 2;
            seq[i] = i % 2 == 0 ? seq[h] : seq[h] + seq[h + 1];
        }
        // sequence(15): 0 1 1 2 1 3 2 3 1 4 3 5 2 5 3
    }
}
