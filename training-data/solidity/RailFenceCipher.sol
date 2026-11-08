// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract RailFenceCipher {
    function encode(string memory s, uint rails) public pure returns (string memory) {
        bytes memory b = bytes(s);
        bytes memory out = new bytes(b.length);
        uint period = 2 * (rails - 1);
        uint k = 0;
        for (uint r = 0; r < rails; r++) {
            for (uint i = 0; i < b.length; i++) {
                uint m = i % period;
                uint rail = m < rails ? m : period - m;
                if (rail == r) out[k++] = b[i];
            }
        }
        return string(out);
    }
}
