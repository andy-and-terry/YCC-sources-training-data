// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract LatticePaths {
    function count(uint256 n) public pure returns (uint256) {
        uint256[] memory row = new uint256[](n + 1);
        for (uint256 i = 0; i <= n; i++) row[i] = 1;
        for (uint256 k = 0; k < n; k++)
            for (uint256 j = 1; j <= n; j++) row[j] += row[j - 1];
        return row[n];
    }
}
