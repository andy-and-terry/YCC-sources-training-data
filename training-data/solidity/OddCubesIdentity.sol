// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OddCubesIdentity {
    function cubeFromOdds(uint256 n) public pure returns (uint256 sum) {
        uint256 start = n * n - n + 1;
        for (uint256 i = 0; i < n; i++) {
            sum += start + 2 * i;
        }
    }

    function holds(uint256 n) public pure returns (bool) {
        return cubeFromOdds(n) == n * n * n;
    }
}
