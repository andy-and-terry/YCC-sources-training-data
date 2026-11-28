// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract AffineCipher {
    function encrypt(string calldata text, uint256 a, uint256 b) external pure returns (string memory) {
        bytes memory s = bytes(text);
        bytes memory out = new bytes(s.length);
        for (uint256 i = 0; i < s.length; i++) {
            uint8 ch = uint8(s[i]);
            if (ch >= 65 && ch <= 90) {
                out[i] = bytes1(uint8(((a * (ch - 65) + b) % 26) + 65));
            } else {
                out[i] = s[i];
            }
        }
        return string(out);
    }
}
