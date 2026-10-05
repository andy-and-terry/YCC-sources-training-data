// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library PascalTriangleLib {
    function row(uint256 n) internal pure returns (uint256[] memory r) {
        r = new uint256[](n + 1);
        r[0] = 1;
        for (uint256 i = 1; i <= n; i++) {
            // Update right-to-left so each entry still sees the previous row.
            for (uint256 j = i; j > 0; j--) {
                r[j] += r[j - 1];
            }
        }
    }
}

contract PascalTriangleDemo {
    function rowAt(uint256 n) external pure returns (uint256[] memory) {
        require(n <= 60, "row too large");
        return PascalTriangleLib.row(n);
    }
}
