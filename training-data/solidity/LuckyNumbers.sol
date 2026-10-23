// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LuckyNumbers {
    // Lucky numbers below 100:
    // 1 3 7 9 13 15 21 25 31 33 37 43 49 51 63 67 69 73 75 79 87 93 99
    function lucky() public pure returns (uint256[] memory result) {
        uint256[50] memory list;
        for (uint256 i = 0; i < 50; i++) {
            list[i] = 2 * i + 1;
        }
        uint256 len = 50;
        uint256 idx = 1;
        while (idx < len && list[idx] <= len) {
            uint256 step = list[idx];
            uint256 kept = 0;
            for (uint256 k = 0; k < len; k++) {
                if ((k + 1) % step != 0) {
                    list[kept] = list[k];
                    kept++;
                }
            }
            len = kept;
            idx++;
        }
        result = new uint256[](len);
        for (uint256 i = 0; i < len; i++) {
            result[i] = list[i];
        }
    }
}
