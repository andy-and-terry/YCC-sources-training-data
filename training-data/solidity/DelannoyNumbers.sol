// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract DelannoyNumbers {
    function central(uint256 n) public pure returns (uint256) {
        uint256[] memory row = new uint256[](n + 1);
        for (uint256 j = 0; j <= n; j++) row[j] = 1;
        for (uint256 i = 1; i <= n; i++) {
            uint256 diagPrev = row[0];
            row[0] = 1;
            for (uint256 j = 1; j <= n; j++) {
                uint256 up = row[j];
                row[j] = up + row[j - 1] + diagPrev;
                diagPrev = up;
            }
        }
        return row[n];
    }
}
