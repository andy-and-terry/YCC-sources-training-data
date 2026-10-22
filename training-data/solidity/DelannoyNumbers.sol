// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DelannoyNumbers {
    // D(0..9): 1 3 13 63 321 1683 8989 48639 265729 1462563
    function central() public pure returns (uint256[10] memory diag) {
        uint256[10][10] memory d;
        for (uint256 m = 0; m < 10; m++) {
            for (uint256 n = 0; n < 10; n++) {
                if (m == 0 || n == 0) {
                    d[m][n] = 1;
                } else {
                    d[m][n] = d[m - 1][n] + d[m][n - 1] + d[m - 1][n - 1];
                }
            }
            diag[m] = d[m][m];
        }
    }
}
