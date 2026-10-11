// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract TwoDimensionalArrayDemo {
    uint256[3][3] public grid;

    function set(uint256 r, uint256 c, uint256 v) external {
        grid[r][c] = v;
    }

    function trace() external view returns (uint256 t) {
        for (uint256 i = 0; i < 3; i++) t += grid[i][i];
    }

    function transpose() external view returns (uint256[3][3] memory out) {
        for (uint256 i = 0; i < 3; i++) {
            for (uint256 j = 0; j < 3; j++) {
                out[j][i] = grid[i][j];
            }
        }
    }
}
