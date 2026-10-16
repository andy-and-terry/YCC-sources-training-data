// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ArrayMemoryBuildDemo {
    uint256[] public data = [5, 12, 7, 20, 3, 18];

    function evensOnly() external view returns (uint256[] memory) {
        uint256 count;
        for (uint256 i = 0; i < data.length; i++) {
            if (data[i] % 2 == 0) count++;
        }
        uint256[] memory out = new uint256[](count);
        uint256 j;
        for (uint256 i = 0; i < data.length; i++) {
            if (data[i] % 2 == 0) out[j++] = data[i];
        }
        return out;
    }

    function sum() external view returns (uint256 total) {
        for (uint256 i = 0; i < data.length; i++) total += data[i];
    }
}
