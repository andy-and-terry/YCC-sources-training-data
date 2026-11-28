// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BurrowsWheeler {
    function rotate(bytes memory s, uint256 i) internal pure returns (bytes memory r) {
        r = new bytes(s.length);
        for (uint256 j = 0; j < s.length; j++) r[j] = s[(i + j) % s.length];
    }

    function bwt(bytes memory s) public pure returns (bytes memory out) {
        uint256 n = s.length;
        bytes[] memory rots = new bytes[](n);
        for (uint256 i = 0; i < n; i++) rots[i] = rotate(s, i);
        for (uint256 i = 1; i < n; i++) {
            bytes memory key = rots[i];
            uint256 j = i;
            while (j > 0 && lessThan(key, rots[j - 1])) {
                rots[j] = rots[j - 1];
                j--;
            }
            rots[j] = key;
        }
        out = new bytes(n);
        for (uint256 i = 0; i < n; i++) out[i] = rots[i][n - 1];
    }

    function lessThan(bytes memory a, bytes memory b) internal pure returns (bool) {
        for (uint256 i = 0; i < a.length; i++) {
            if (a[i] != b[i]) return a[i] < b[i];
        }
        return false;
    }
}
