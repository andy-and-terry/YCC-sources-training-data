// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract RollingHash {
    uint256 constant B = 31;
    uint256 constant M = 1000003;

    function windowHashes(bytes memory s, uint256 k) public pure returns (uint256[] memory out) {
        out = new uint256[](s.length - k + 1);
        for (uint256 i = 0; i + k <= s.length; i++) {
            uint256 h = 0;
            for (uint256 j = 0; j < k; j++) h = (h * B + uint8(s[i + j])) % M;
            out[i] = h;
        }
    }
}
