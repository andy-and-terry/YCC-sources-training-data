// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SelfDescribingNumbers {
    function isSelfDescribing(string memory s) public pure returns (bool) {
        bytes memory b = bytes(s);
        for (uint256 i = 0; i < b.length; i++) {
            uint256 count = 0;
            for (uint256 j = 0; j < b.length; j++) {
                if (uint8(b[j]) == 48 + i) count++;
            }
            if (count != uint8(b[i]) - 48) return false;
        }
        return true;
    }
}
