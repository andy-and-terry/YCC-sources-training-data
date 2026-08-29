// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library SieveOfEratosthenesLib {
    function primesUpTo(uint256 limit) internal pure returns (uint256[] memory) {
        bool[] memory isComposite = new bool[](limit + 1);
        for (uint256 i = 2; i * i <= limit; i++) {
            if (!isComposite[i]) {
                for (uint256 j = i * i; j <= limit; j += i) {
                    isComposite[j] = true;
                }
            }
        }
        uint256 count = 0;
        for (uint256 n = 2; n <= limit; n++) {
            if (!isComposite[n]) count++;
        }
        uint256[] memory result = new uint256[](count);
        uint256 idx = 0;
        for (uint256 n = 2; n <= limit; n++) {
            if (!isComposite[n]) {
                result[idx] = n;
                idx++;
            }
        }
        return result;
    }
}
