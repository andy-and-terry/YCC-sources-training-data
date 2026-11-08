// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract HanoiMoveCount {
    function moves(uint n) public pure returns (uint) {
        if (n == 0) return 0;
        return 2 * moves(n - 1) + 1;
    }
}
