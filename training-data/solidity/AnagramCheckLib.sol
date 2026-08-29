// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library AnagramCheckLib {
    function isAnagram(string memory a, string memory b) internal pure returns (bool) {
        bytes memory ba = bytes(a);
        bytes memory bb = bytes(b);
        if (ba.length != bb.length) return false;

        uint256[256] memory counts;
        for (uint256 i = 0; i < ba.length; i++) {
            counts[uint8(ba[i])]++;
            counts[uint8(bb[i])]--;
        }
        for (uint256 i = 0; i < 256; i++) {
            if (counts[i] != 0) return false;
        }
        return true;
    }
}
