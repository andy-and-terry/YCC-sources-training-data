// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract RailFenceCipher {
    function encode(string memory text, uint8 rails) public pure returns (string memory) {
        bytes memory t = bytes(text);
        bytes memory out = new bytes(t.length);
        uint256 k = 0;
        for (uint8 row = 0; row < rails; row++) {
            int256 r = 0;
            int256 step = 1;
            for (uint256 i = 0; i < t.length; i++) {
                if (uint256(r) == row) out[k++] = t[i];
                if (r == 0) step = 1;
                else if (r == int256(uint256(rails)) - 1) step = -1;
                r += step;
            }
        }
        return string(out);
    }
}
