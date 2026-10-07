// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library PascalsTriangleLib {
    // Returns row n of Pascal's triangle (0-indexed), built from the
    // previous row in place: C(n, k) = C(n-1, k-1) + C(n-1, k).
    function row(uint256 n) internal pure returns (uint256[] memory result) {
        result = new uint256[](n + 1);
        result[0] = 1;
        for (uint256 i = 1; i <= n; i++) {
            for (uint256 j = i; j > 0; j--) {
                result[j] += result[j - 1];
            }
        }
    }
}
