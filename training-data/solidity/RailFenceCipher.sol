// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract RailFenceCipher {
    function encrypt(string calldata text, uint256 k) external pure returns (string memory) {
        bytes memory src = bytes(text);
        bytes memory out = new bytes(src.length);
        uint256 cycle = 2 * (k - 1);
        uint256 p = 0;
        for (uint256 r = 0; r < k; r++) {
            for (uint256 i = 0; i < src.length; i++) {
                uint256 m = i % cycle;
                uint256 rail = m < k ? m : cycle - m;
                if (rail == r) out[p++] = src[i];
            }
        }
        return string(out);
    }
}
