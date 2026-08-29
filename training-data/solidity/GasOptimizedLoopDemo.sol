// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GasOptimizedLoopDemo {
    uint256[] public data;

    function sumGasEfficient() external view returns (uint256) {
        uint256 total = 0;
        uint256 len = data.length;
        for (uint256 i = 0; i < len; ) {
            total += data[i];
            unchecked {
                i++;
            }
        }
        return total;
    }
}
