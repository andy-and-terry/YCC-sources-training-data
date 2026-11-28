// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract LyndonFactorization {
    /// Returns the lengths of the Lyndon factors of `s` (Duval's algorithm).
    function factorLengths(bytes memory s) public pure returns (uint256[] memory) {
        uint256 n = s.length;
        uint256[] memory tmp = new uint256[](n);
        uint256 count = 0;
        uint256 i = 0;
        while (i < n) {
            uint256 j = i + 1;
            uint256 k = i;
            while (j < n && s[k] <= s[j]) {
                k = s[k] < s[j] ? i : k + 1;
                j++;
            }
            while (i <= k) {
                tmp[count++] = j - k;
                i += j - k;
            }
        }
        uint256[] memory out = new uint256[](count);
        for (uint256 x = 0; x < count; x++) out[x] = tmp[x];
        return out;
    }
}
